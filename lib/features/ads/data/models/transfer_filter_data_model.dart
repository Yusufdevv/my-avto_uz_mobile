import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TransferFilterData extends Equatable {
  final BodyTypeEntity? bodyType;
  final GearboxTypeEntity? gearboxType;
  final DriveTypeEntity? driveType;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency? currency;
  final bool? isFilter;
  final bool? isRentWithPurchase;

  const TransferFilterData({
    this.currency,
    this.isRentWithPurchase,
    this.yearValues,
    this.bodyType,
    this.gearboxType,
    this.priceValues,
    this.driveType,
    this.isFilter,
  });

  @override
  List<Object?> get props => [
        currency,
        isRentWithPurchase,
        yearValues,
        bodyType,
        gearboxType,
        priceValues,
        driveType,
        isFilter,
      ];
}
