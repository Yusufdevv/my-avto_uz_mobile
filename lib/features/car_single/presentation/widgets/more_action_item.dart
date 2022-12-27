import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreActionItem extends StatelessWidget {
  final String icon;
  final Color color;
  final String text;
  final VoidCallback onTap;

  const MoreActionItem(
      {Key? key, required this.icon, required this.text, required this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
    onTap:onTap,
    child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              12,
            ),
            border: Border.all(
              color: const Color(
                0xffF1F1F5,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 14,
          ),
          margin: const EdgeInsets.only(top: 8, right: 16, left: 16),
          child: Center(
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: const Color(
                          0xff171725,
                        ),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
        ),
  );
}
