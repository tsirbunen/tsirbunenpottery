import 'package:madmudmobile/features/collections_and_pieces/domain/models/category/category.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/design/design.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/products/products.dart';
import 'package:madmudmobile/localization/languages.dart';

// Test Collections
const whiteOnWhite = Collection(id: 'coll-1', name: 'White on white');
const yellowCottage = Collection(id: 'coll-2', name: 'Yellow Cottage');
const emptyCollection = Collection(id: 'coll-3', name: 'Empty Collection');

// Test Categories
const mugsAndCups = Category(
    id: 'cat-1',
    names: {Language.en: 'Mugs and Cups', Language.fi: 'Mukit ja kupit'});
const platesAndBowls = Category(id: 'cat-2', names: {
  Language.en: 'Plates and Bowls',
  Language.fi: 'Lautaset ja kulhot'
});
const kitchenAccessories = Category(id: 'cat-3', names: {
  Language.en: 'Kitchen Accessories',
  Language.fi: 'Keittiötarvikkeet'
});
const emptyCategory = Category(
    id: 'cat-4',
    names: {Language.en: 'Empty Category', Language.fi: 'Tyhjä kategoria'});

// Test Designs
final wakingLight = Design(
  id: 'design-1',
  names: {Language.en: 'Waking Light', Language.fi: 'Heräävä valo'},
  categoryIds: [mugsAndCups.id],
);
final softLinen = Design(
  id: 'design-2',
  names: {Language.en: 'Soft Linen', Language.fi: 'Pehmeä pellava'},
  categoryIds: [mugsAndCups.id, kitchenAccessories.id],
);
final saltAndFoam = Design(
  id: 'design-3',
  names: {Language.en: 'Salt & Foam', Language.fi: 'Suola ja vaahto'},
  categoryIds: [platesAndBowls.id],
);

// Test Pieces
final testPieces = [
  Piece(
      id: 'pcs-1',
      serialNumber: 3,
      designId: wakingLight.id,
      collectionId: whiteOnWhite.id),
  Piece(
      id: 'pcs-2',
      serialNumber: 4,
      designId: softLinen.id,
      collectionId: whiteOnWhite.id),
  Piece(
      id: 'pcs-3',
      serialNumber: 5,
      designId: softLinen.id,
      collectionId: whiteOnWhite.id),
  Piece(
      id: 'pcs-4',
      serialNumber: 6,
      designId: saltAndFoam.id,
      collectionId: yellowCottage.id),
  Piece(
      id: 'pcs-5',
      serialNumber: 7,
      designId: saltAndFoam.id,
      collectionId: yellowCottage.id),
  Piece(
      id: 'pcs-6',
      serialNumber: 8,
      designId: saltAndFoam.id,
      collectionId: yellowCottage.id),
];

final testPiecesById = {
  for (final piece in testPieces) piece.id: piece,
};

final testProducts = Products(
  pieces: testPieces,
  designs: [wakingLight, softLinen, saltAndFoam],
  categories: [mugsAndCups, platesAndBowls, kitchenAccessories, emptyCategory],
  collections: [whiteOnWhite, yellowCottage, emptyCollection],
);
