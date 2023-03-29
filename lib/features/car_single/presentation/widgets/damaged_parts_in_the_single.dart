import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/car_status_icon_on_single.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamagedPartsInTheSingle extends StatelessWidget {
  final double k;
  final double height;
  final double width;
  final double imageWidth;
  final Size imageSize;

  final List<DamagedPartsAsEnum> damages;

  DamagedPartsInTheSingle({
    required this.k,
    required this.damages,
    required this.height,
    required this.width,
    required this.imageSize,
    Key? key,
  })  : imageWidth = k * imageSize.width,
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(

        alignment: Alignment.center,
        width: width  ,
        child: SizedBox(
          height: (imageWidth * imageSize.height) / imageSize.width,
          width: imageWidth,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  AppIcons.autoModel,
                  fit: BoxFit.cover,
                ),
              ),
              ...List.generate(
                damages.length,
                (index) => CarStatusIconInPicture(
                  k: k,
                  type: damages[index].type,
                  alignment: MyFunctions.getDamagePosition(
                    part: damages[index].part,
                    width: width,
                    height: height,
                  ),
                ),
              ).toList(),
            ],
          ),
        ),
      );
}
