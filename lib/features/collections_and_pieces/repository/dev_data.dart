import 'package:madmudmobile/features/collections_and_pieces/domain/models/collection/collection.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/design/design.dart';
import 'package:madmudmobile/features/collections_and_pieces/domain/models/piece/piece.dart';
import 'package:madmudmobile/localization/languages.dart';

// Define Collections
const whiteOnWhite = Collection(
    uuid: '4f7c938e-863d-4b91-9026-f097b5b5041a', name: 'White on white');
const yellowCottage = Collection(
    uuid: 'c2dce464-9259-4e2c-8f13-748dc9c12ff7', name: 'Yellow Cottage');
const midnightForest = Collection(
    uuid: 'acc3a2c1-c002-4a6e-a05f-d6c60b9ae43f', name: 'Midnight Forest');
const oceanBreeze = Collection(
    uuid: '91b5b4de-bb86-4de6-b33d-7c3e0ac83c9a', name: 'Ocean Breeze');

// Define Designs
const goodMorning = Design(
    uuid: 'd7c17494-2c2b-4a3b-84f2-11f1391e9d6e',
    names: {Language.en: 'Lazy Morning', Language.fi: 'Laiska aamu'});
const wakingLight = Design(
    uuid: 'a5d3e4e6-45f5-48f3-98a7-944a634c5680',
    names: {Language.en: 'Waking Light', Language.fi: 'Heräävä valo'});
const softLinen = Design(
    uuid: '11f3b13c-716e-4ef7-952e-2b6d8a77df51',
    names: {Language.en: 'Soft Linen', Language.fi: 'Pehmeä pellava'});
const sunlitGarden = Design(
    uuid: '5b91aaec-7a39-45db-a43d-c0f4c7c28d62',
    names: {Language.en: 'Sunlit Garden', Language.fi: 'Aurinkopuutarha'});
const buttercup = Design(
    uuid: '58f49d0b-b2f3-4725-99c6-1a6fa8e14397',
    names: {Language.en: 'Buttercup', Language.fi: 'Voikukka'});
const lemonLight = Design(
    uuid: '5f177701-9b52-4c4d-91df-3b437a3510a3',
    names: {Language.en: 'Lemon Light', Language.fi: 'Sitruunavalo'});
const goldenHour = Design(
    uuid: '07f7b118-eac6-42cf-9828-77810dce05f1',
    names: {Language.en: 'Golden Hour', Language.fi: 'Kultainen hetki'});
const rusticCharm = Design(
    uuid: '207da2ac-5b9e-456a-91a4-7f0e55b92d2b',
    names: {Language.en: 'Rustic Charm', Language.fi: 'Maalaistunnelma'});
const cornfield = Design(
    uuid: '48f935ec-92d7-4027-91b3-379bf29bc2eb',
    names: {Language.en: 'Cornfield', Language.fi: 'Maissipelto'});
const sunbeam = Design(
    uuid: '92a270a3-e2d4-4c6a-9a5d-bfa560c6e679',
    names: {Language.en: 'Sunbeam', Language.fi: 'Auringonsäde'});
const mossTwilight = Design(
    uuid: '7f68b927-6810-4f30-9d45-0104e65c2be3',
    names: {Language.en: 'Moss Twilight', Language.fi: 'Sammalen hämärä'});
const blueDrift = Design(
    uuid: '8c4f82c5-6402-4a7a-90cc-884ec112cb4d',
    names: {Language.en: 'Blue Drift', Language.fi: 'Sininen virta'});
const saltAndFoam = Design(
    uuid: '984a27dc-e017-4f86-a019-08354ec01b9c',
    names: {Language.en: 'Salt & Foam', Language.fi: 'Suola ja vaahto'});
const pebbleShore = Design(
    uuid: '663924d4-1c40-4e1f-8e59-9493aa2b4e49',
    names: {Language.en: 'Pebble Shore', Language.fi: 'Sora ranta'});
const seaGlass = Design(
    uuid: 'ed2a1a8c-bde2-4a92-b9d2-fb8889a6537b',
    names: {Language.en: 'Sea Glass', Language.fi: 'Meren lasi'});

// Define Pieces
final pieces = [
  const Piece(
      uuid: 'ff0fe6b3-fa6e-4a23-b349-b7f628db6926',
      serialNumber: 1,
      design: goodMorning,
      collection: whiteOnWhite),
  const Piece(
      uuid: '0f88f0fa-3c93-437e-b46c-b93c1cb1a733',
      serialNumber: 2,
      design: goodMorning,
      collection: whiteOnWhite),
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
      design: softLinen,
      collection: whiteOnWhite),
  const Piece(
      uuid: '69af1dba-055e-4493-8c89-d20177b67d5c',
      serialNumber: 7,
      design: sunlitGarden,
      collection: yellowCottage),
  const Piece(
      uuid: '9f52afce-13c7-491c-92de-d0e193f23bc3',
      serialNumber: 8,
      design: sunlitGarden,
      collection: yellowCottage),
  const Piece(
      uuid: '65a14786-7756-4ab0-a19d-acd2ace0734e',
      serialNumber: 9,
      design: buttercup,
      collection: yellowCottage),
  const Piece(
      uuid: 'cb000204-b7b0-4adc-8b12-0185c93dc0d0',
      serialNumber: 10,
      design: buttercup,
      collection: yellowCottage),
  const Piece(
      uuid: '3e453fdd-a011-4eb9-86ca-bf927a4e1204',
      serialNumber: 11,
      design: buttercup,
      collection: yellowCottage),
  const Piece(
      uuid: '1ce2e768-4cd3-48b0-a37f-65d0e0606580',
      serialNumber: 12,
      design: lemonLight,
      collection: yellowCottage),
  const Piece(
      uuid: '48d88578-458a-4fc5-a91c-03b4de162838',
      serialNumber: 13,
      design: lemonLight,
      collection: yellowCottage),
  const Piece(
      uuid: '71aacfa9-9b87-426c-ba58-eb969aa13112',
      serialNumber: 14,
      design: goldenHour,
      collection: yellowCottage),
  const Piece(
      uuid: 'c23b7ac5-b8d7-4f24-a25b-dc404fed4bbe',
      serialNumber: 15,
      design: goldenHour,
      collection: yellowCottage),
  const Piece(
      uuid: 'be52a0e3-31af-4724-9073-1c2f14d45e28',
      serialNumber: 16,
      design: rusticCharm,
      collection: yellowCottage),
  const Piece(
      uuid: '4517636c-ee3b-4980-b084-968bafa53473',
      serialNumber: 17,
      design: rusticCharm,
      collection: yellowCottage),
  const Piece(
      uuid: 'fd5a0e16-41c7-4a70-b10c-4731c46e13fc',
      serialNumber: 18,
      design: rusticCharm,
      collection: yellowCottage),
  const Piece(
      uuid: 'a738a8b2-2686-40f9-b7a4-08129cd150f1',
      serialNumber: 19,
      design: cornfield,
      collection: yellowCottage),
  const Piece(
      uuid: '15ca2e39-8335-4d8e-93c4-44a039925d2a',
      serialNumber: 20,
      design: sunbeam,
      collection: yellowCottage),
  const Piece(
      uuid: '6755cbcd-d014-47c9-98e9-135dac76da58',
      serialNumber: 21,
      design: sunbeam,
      collection: yellowCottage),
  const Piece(
      uuid: 'f75eff1b-9904-488d-a885-961e56c3e661',
      serialNumber: 22,
      design: mossTwilight,
      collection: midnightForest),
  const Piece(
      uuid: 'd2d5f6b8-8600-4fe8-86e8-fbdce220462a',
      serialNumber: 23,
      design: mossTwilight,
      collection: midnightForest),
  const Piece(
      uuid: '685a0dfb-d25a-45be-b0a8-559931650140',
      serialNumber: 24,
      design: mossTwilight,
      collection: midnightForest),
  const Piece(
      uuid: 'b77a33cd-c76e-4476-854c-3eaa374f09b8',
      serialNumber: 25,
      design: blueDrift,
      collection: oceanBreeze),
  const Piece(
      uuid: 'a8a4eca6-6d59-4bb9-958d-355aaa2f32ed',
      serialNumber: 26,
      design: blueDrift,
      collection: oceanBreeze),
  const Piece(
      uuid: '4083298a-9b40-41eb-b912-494e5bb6baa2',
      serialNumber: 27,
      design: saltAndFoam,
      collection: oceanBreeze),
  const Piece(
      uuid: '39b2ce1a-f03f-4c7b-9c72-0e4793f65083',
      serialNumber: 28,
      design: pebbleShore,
      collection: oceanBreeze),
  const Piece(
      uuid: '1afb9e69-8924-4ccc-b28a-ce6075692e91',
      serialNumber: 29,
      design: pebbleShore,
      collection: oceanBreeze),
  const Piece(
      uuid: 'b3aba2bb-e38c-4745-a69e-dc24a1fa8e6d',
      serialNumber: 30,
      design: pebbleShore,
      collection: oceanBreeze),
  const Piece(
      uuid: 'bc2f3e16-577a-45a2-97c7-434a037e11e7',
      serialNumber: 31,
      design: seaGlass,
      collection: oceanBreeze),
  const Piece(
      uuid: '6d77f82f-95b1-41a9-8737-5e06f620f674',
      serialNumber: 32,
      design: seaGlass,
      collection: oceanBreeze),
  const Piece(
      uuid: 'd951486b-8738-4d50-9a53-073d93913a90',
      serialNumber: 33,
      design: seaGlass,
      collection: oceanBreeze),
  const Piece(
      uuid: 'ba141997-aa30-4260-8f93-bc02b74120da',
      serialNumber: 34,
      design: cornfield,
      collection: yellowCottage),
];
