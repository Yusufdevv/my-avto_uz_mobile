import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceOrProductButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final int more;

  const ServiceOrProductButton(
      {required this.onTap, required this.title, this.more = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          height: 39,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 16,
                spreadRadius: 0,
                color: darkBlack.withOpacity(.05),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: white,
            border: Border.all(
              width: 1,
              color: dividerColor,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Text(
                more.toString(),
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                AppIcons.chevronRight1,
                color: grey,
              ),
            ],
          ),
        ),
      );
}
