import 'package:madmudmobile/features/collections_and_pieces/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/design/design.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';
import 'package:madmudmobile/localization/languages.dart';

// Test Collections
const whiteOnWhite = Collection(
    uuid: '4f7c938e-863d-4b91-9026-f097b5b5041a', name: 'White on white');
const yellowCottage = Collection(
    uuid: 'c2dce464-9259-4e2c-8f13-748dc9c12ff7', name: 'Yellow Cottage');

// Test Designs
const wakingLight = Design(
    uuid: 'a5d3e4e6-45f5-48f3-98a7-944a634c5680',
    names: {Language.en: 'Waking Light', Language.fi: 'Heräävä valo'});
const softLinen = Design(
    uuid: '11f3b13c-716e-4ef7-952e-2b6d8a77df51',
    names: {Language.en: 'Soft Linen', Language.fi: 'Pehmeä pellava'});
const saltAndFoam = Design(
    uuid: '984a27dc-e017-4f86-a019-08354ec01b9c',
    names: {Language.en: 'Salt & Foam', Language.fi: 'Suola ja vaahto'});

// Test Pieces
final testPieces = [
  const Piece(
      uuid: '0ea63bfd-a29c-4cfe-ae2a-0a8f4f77a30a',
      serialNumber: 3,
      design: wakingLight,
      collection: whiteOnWhite),
  const Piece(
      uuid: '5b5cfc91-37b1-4a3b-b900-2613361069d4',
      serialNumber: 4,
      design: softLinen,
      collection: whiteOnWhite),
  const Piece(
      uuid: '7420ff74-e073-4cbb-b027-5aa91361916f',
      serialNumber: 5,
      design: softLinen,
      collection: whiteOnWhite),
  const Piece(
      uuid: '1a72a0b5-d28f-4171-9c88-97851fa6aaf8',
      serialNumber: 6,
      design: saltAndFoam,
      collection: yellowCottage),
  const Piece(
      uuid: '69af1dba-055e-4493-8c89-d20177b67d5c',
      serialNumber: 7,
      design: saltAndFoam,
      collection: yellowCottage),
  const Piece(
      uuid: '9f52afce-13c7-491c-92de-d0e193f23bc3',
      serialNumber: 8,
      design: saltAndFoam,
      collection: yellowCottage),
];
