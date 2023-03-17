// ignore_for_file: constant_identifier_names

const String CACHED_DRAFT_ANNOUNCEMENT = 'draft_announcement';

enum DamagedPart {
  rightFrontDoor('rigth_front_door'),
  rightRearDoor('right_rear_door'),
  leftFrontDoor('left_front_door'),
  leftRearDoor('left_rear_door'),
  frontBumper('front_bumper'),
  rearBumper('rear_bumper'),
  frontLeftFender('front_left_fender'),
  frontRightFender('front_right_fender'),
  rearLeftFender('rear_left_fender'),
  rearRightFender('rear_right_fender'),
  roof('roof'),
  hood('hood'),
  trunk('trunk');

  const DamagedPart(this.value);

  final String value;
}

enum DamageType {
  ideal('ideal'),
  withDents('with_dents'),
  scratched('scratched'),
  replaced('replaced'),
  requiresReplacement('requires_replacement');

  const DamageType(this.value);

  final String value;
}

enum Currency  {
  uzs('uzs'),
  usd('usd'),
  none('');

  const Currency(this.value);

  final String value;
}
enum ModerationStatusEnum  {
  active('active'),
  blocked('blocked'),
  sold('sold'),
  in_moderation('in_moderation');

  const ModerationStatusEnum(this.value);

  final String value;
}

enum TransactionStatus {
  waiting('waiting'),
  paid('paid'),
  failed('failed'),
  canceled('canceled');

  const TransactionStatus(this.value);

  final String value;
}

enum SortStatus {
  none(''),
  cheapest('-price'),
  expensive('price'),
  oldest('created_at'),
  newest('-created_at');

  const SortStatus(this.value);

  final String value;
}

enum Ownership {
  first('first'),
  second('second'),
  third('third'),
  other('other');

  const Ownership(this.value);

  final String value;
}

enum LicenceType {
  original('original'),
  duplicate('duplicate');

  const LicenceType(this.value);

  final String value;
}
enum TarifTypeEnum {
  vip('vip'),
  top('top'),
  none(''),
  hot('hot');

  const TarifTypeEnum(this.value);

  final String value;
}
