import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? desc;
  final String? phone;

  const AuthHeader({required this.title, Key? key, this.phone, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 32),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            desc ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: grey),
          ),
          const SizedBox(
            height: 12,
          ),
          if (phone != null && phone!.isNotEmpty)
            WScaleAnimation(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 7, 9, 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
                child: Text(
                  phone.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: grey),
                ),
              ),
            )
        ],
      );
}
