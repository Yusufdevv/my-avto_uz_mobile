import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';

class VinSoonItem extends StatelessWidget {
  const VinSoonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        margin: const EdgeInsets.only(
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: const Color(
                  0xff5ECC81,
                ),
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
              child: Text(
                'В скором времени',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Отчёт о проверке по VIN',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: const Color(0xff171725),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'VIN проверка позволит получиить детализированную информацию об автомобиле',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: const Color(0xff171725),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  AppImages.vin_soon,
                )
              ],
            ),
          ],
        ),
      );
}
