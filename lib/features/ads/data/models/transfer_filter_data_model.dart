import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
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
  final SaleType? saleType;

  const TransferFilterData({
    this.currency,
    this.saleType,
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
        saleType,
        yearValues,
        bodyType,
        gearboxType,
        priceValues,
        driveType,
        isFilter,
      ];
}
