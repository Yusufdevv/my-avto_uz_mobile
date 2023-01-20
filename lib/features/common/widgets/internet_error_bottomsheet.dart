import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InternetErrorBottomSheet extends StatelessWidget {
  final VoidCallback onTap;

  const InternetErrorBottomSheet({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              AppIcons.inet_error,
              width: 130,
              height: 130,
            ),
            const SizedBox(height: 20,),
            Text(
              'Интернет-соединение потеряно',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: dark,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Проблема с интернетом, попробуйте еще раз',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: const Color(0xff696974),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 48,
            ),
            WButton(
              onTap: onTap,
              color: orange,
              child: Center(
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      AppIcons.refresh1,
                      color: white,
                    ),
                    Text(
                      'Повторить',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
