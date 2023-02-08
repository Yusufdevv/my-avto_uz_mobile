// ignore_for_file: constant_identifier_names

const String CACHED_DRAFT_ANNOUNCEMENT = 'draft_announcement';

enum DamagedParts {
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

  const DamagedParts(this.value);

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

enum Currency {
  uzs('uzs'),
  usd('usd'),
  euro('euro');

  const Currency(this.value);

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
