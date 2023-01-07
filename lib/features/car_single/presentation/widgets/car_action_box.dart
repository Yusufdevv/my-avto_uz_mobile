import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class CarActionsBox extends StatelessWidget {
  final CarStatistic carStatistic;
  final Widget widget;
  final VoidCallback onTap;

  const CarActionsBox(
      {required this.onTap,
      Key? key,
      required this.carStatistic,
      required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget,
              const SizedBox(
                height: 4,
              ),
              Text(
                carStatistic.valueText,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: const Color(0xff696974)),
              )
            ],
          ),
        ),
      );
}
