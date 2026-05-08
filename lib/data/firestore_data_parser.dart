import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/data/identifiable.dart';
import 'package:tsirbunenpottery/features/categories/domain/models/category/category.dart';
import 'package:tsirbunenpottery/features/collections/domain/models/collection/collection.dart';
import 'package:tsirbunenpottery/features/designs/domain/models/design/design.dart';
import 'package:tsirbunenpottery/features/pieces/domain/models/piece/piece.dart';
import 'package:tsirbunenpottery/localization/languages.dart';

const _tag = 'FirestoreDataParser';

abstract final class _Fields {
  static const id = 'id';
  static const names = 'names';
  static const description = 'description';
  static const details = 'details';
  static const categoryIds = 'categoryIds';
  static const designId = 'designId';
  static const collectionId = 'collectionId';
  static const imageFileNames = 'imageFileNames';
  static const sold = 'sold';
}

class FirestoreDataParser {
  static final _languageByName = {
    for (final lang in Language.values) lang.name: lang,
  };

  final AppLogger _logger;

  const FirestoreDataParser({required AppLogger logger}) : _logger = logger;

  Collection? parseCollection(Map<String, dynamic> data) {
    final id = data[_Fields.id];
    if (id is! String) {
      _logger.logWarning('Collection missing id field', tag: _tag);
      return null;
    }
    try {
      return Collection(
        id: id,
        description: _toStringTranslations(data, _Fields.description),
        names: _toStringTranslations(data, _Fields.names),
      );
    } catch (e) {
      _logger.logWarning('Failed to parse collection "$id": $e', tag: _tag, error: e);
      return null;
    }
  }

  Category? parseCategory(Map<String, dynamic> data) {
    final id = data[_Fields.id];
    if (id is! String) {
      _logger.logWarning('Category missing id field', tag: _tag);
      return null;
    }
    try {
      return Category(
        id: id,
        names: _toStringTranslations(data, _Fields.names),
      );
    } catch (e) {
      _logger.logWarning('Failed to parse category "$id": $e', tag: _tag, error: e);
      return null;
    }
  }

  Design? parseDesign(Map<String, dynamic> data, List<Category> categories) {
    final id = data[_Fields.id];
    if (id is! String) {
      _logger.logWarning('Design missing id field', tag: _tag);
      return null;
    }
    try {
      return Design(
        id: id,
        names: _toStringTranslations(data, _Fields.names),
        categoryIds: _idsOfRefs<Category>(data, categories, _Fields.categoryIds),
        description: _toStringTranslations(data, _Fields.description),
        details: _toStringMapTranslations(data, _Fields.details),
      );
    } catch (e) {
      _logger.logWarning('Failed to parse design "$id": $e', tag: _tag, error: e);
      return null;
    }
  }

  Piece? parsePiece(
    Map<String, dynamic> data,
    List<Design> designs,
    List<Collection> collections,
  ) {
    final id = data[_Fields.id];
    if (id is! String) {
      _logger.logWarning('Piece missing id field', tag: _tag);
      return null;
    }
    try {
      final designId = _idOfRef<Design>(data, designs, _Fields.designId);
      if (designId == null) {
        _logger.logWarning('Skipping piece "$id" — designId missing or unresolved', tag: _tag);
        return null;
      }

      return Piece(
        id: id,
        designId: designId,
        imageFileNames: (data[_Fields.imageFileNames] is! List
                ? <dynamic>[]
                : data[_Fields.imageFileNames] as List<dynamic>)
            .where((e) {
              if (e is String) return true;
              _logger.logWarning(
                'Piece "$id" — imageFileNames contains non-String value: $e (${e.runtimeType})',
                tag: _tag,
              );
              return false;
            })
            .cast<String>()
            .toList(),
        collectionId: _idOfRef(data, collections, _Fields.collectionId),
        sold: data[_Fields.sold] is bool ? data[_Fields.sold] as bool : false,
      );
    } catch (e) {
      _logger.logWarning('Failed to parse piece "$id": $e', tag: _tag, error: e);
      return null;
    }
  }

  Language? _toLanguage(String key) => _languageByName[key];

  Map<Language, String> _toStringTranslations(Map<String, dynamic> data, String fieldName) {
    final raw = data[fieldName];
    if (raw is! Map<String, dynamic>) return {};
    final result = <Language, String>{};
    for (final entry in raw.entries) {
      final language = _toLanguage(entry.key);
      if (language != null && entry.value is String) {
        result[language] = entry.value as String;
      }
    }
    return result;
  }

  Map<Language, Map<String, String>> _toStringMapTranslations(
      Map<String, dynamic> data, String fieldName) {
    final raw = data[fieldName];
    if (raw is! Map<String, dynamic>) return {};
    final result = <Language, Map<String, String>>{};
    for (final entry in raw.entries) {
      final language = _toLanguage(entry.key);
      if (language == null) continue;
      try {
        final Map<String, dynamic> parsedMap;
        if (entry.value is String) {
          parsedMap = jsonDecode(entry.value as String) as Map<String, dynamic>;
        } else if (entry.value is Map) {
          parsedMap = (entry.value as Map).cast<String, dynamic>();
        } else {
          _logger.logWarning(
            'Unexpected type for "$fieldName.${entry.key}": ${entry.value.runtimeType}',
            tag: _tag,
          );
          continue;
        }
        result[language] = parsedMap.map(
          (k, v) => MapEntry(k, v is String ? v : v.toString()),
        );
      } catch (e) {
        _logger.logWarning(
          'Failed to parse "$fieldName" details for language "${entry.key}": $e',
          tag: _tag,
          error: e,
        );
      }
    }
    return result;
  }

  List<String> _idsOfRefs<T extends Identifiable>(
    Map<String, dynamic> data,
    List<T> items,
    String fieldName,
  ) {
    final raw = data[fieldName];
    if (raw is! List) return [];
    final validIds = items.map((e) => e.id).toSet();
    return raw
        .map((e) {
          if (e is DocumentReference) return e.id;
          if (e is String) return e;
          return null;
        })
        .whereType<String>()
        .where(validIds.contains)
        .toList();
  }

  String? _idOfRef<T extends Identifiable>(
      Map<String, dynamic> data, List<T> items, String fieldName) {
    final value = data[fieldName];
    if (value == null) return null;

    final refId = value is DocumentReference
        ? value.id
        : value is String
            ? value
            : null;
    if (refId == null) return null;
    final validIds = items.map((e) => e.id).toSet();
    return validIds.contains(refId) ? refId : null;
  }
}
