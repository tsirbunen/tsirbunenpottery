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

class FirestoreDataParser {
  final AppLogger _logger;

  const FirestoreDataParser({required AppLogger logger}) : _logger = logger;

  Collection? parseCollection(Map<String, dynamic> data) {
    try {
      return Collection(
        id: data['id'] as String,
        description: _toStringTranslations(data, 'description'),
        names: _toStringTranslations(data, 'names'),
      );
    } catch (e) {
      _logger.logWarning(
        'Failed to parse collection "${data['id']}": $e',
        tag: _tag,
        error: e,
      );
      return null;
    }
  }

  Category? parseCategory(Map<String, dynamic> data) {
    try {
      return Category(
        id: data['id'] as String,
        names: _toStringTranslations(data, 'names'),
      );
    } catch (e) {
      _logger.logWarning(
        'Failed to parse category "${data['id']}": $e',
        tag: _tag,
        error: e,
      );
      return null;
    }
  }

  Design? parseDesign(Map<String, dynamic> data, List<Category> categories) {
    try {
      return Design(
        id: data['id'] as String,
        names: _toStringTranslations(data, 'names'),
        categoryIds: _idsOfRefs<Category>(data, categories, 'categoryIds'),
        description: _toStringTranslations(data, 'description'),
        details: _toStringMapTranslations(data, 'details'),
      );
    } catch (e) {
      _logger.logWarning(
        'Failed to parse design "${data['id']}": $e',
        tag: _tag,
        error: e,
      );
      return null;
    }
  }

  Piece? parsePiece(
    Map<String, dynamic> data,
    List<Design> designs,
    List<Collection> collections,
  ) {
    try {
      final designId = _idOfRef<Design>(data, designs, 'designId');
      if (designId == null) {
        _logger.logWarning(
          'Skipping piece "${data['id']}" — designId missing or unresolved',
          tag: _tag,
        );
        return null;
      }

      return Piece(
        id: data['id'] as String,
        designId: designId,
        imageFileNames: (data['imageFileNames'] as List<dynamic>? ?? [])
            .where((e) {
              if (e is String) return true;
              _logger.logWarning(
                'Piece "${data['id']}" — imageFileNames contains non-String value: $e (${e.runtimeType})',
                tag: _tag,
              );
              return false;
            })
            .cast<String>()
            .toList(),
        collectionId: _idOfRef(data, collections, 'collectionId'),
        sold: data['sold'] as bool? ?? false,
      );
    } catch (e) {
      _logger.logWarning(
        'Failed to parse piece "${data['id']}": $e',
        tag: _tag,
        error: e,
      );
      return null;
    }
  }

  Language? _toLanguage(String key) {
    for (final lang in Language.values) {
      if (lang.name == key) return lang;
    }
    return null;
  }

  Map<Language, String> _toStringTranslations(
      Map<String, dynamic> data, String fieldName) {
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
        final Map<String, dynamic> parsedMap = entry.value is String
            ? jsonDecode(entry.value as String) as Map<String, dynamic>
            : (entry.value as Map).cast<String, dynamic>();
        result[language] = parsedMap.map(
          (k, v) => MapEntry(k, v is String ? v : v.toString()),
        );
      } catch (e) {
        _logger.logWarning(
          'Failed to parse "$fieldName" details for language "${entry.key}": $e',
          tag: _tag,
          error: e,
        );
        continue;
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
    return raw.map((e) {
      if (e is DocumentReference) return e.id;
      return e as String;
    }).where(validIds.contains).toList();
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
