import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ButtonGoToComparison extends StatelessWidget {
  const ButtonGoToComparison({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -8),
                blurRadius: 24,
                color: dark.withOpacity(0.25)),
            BoxShadow(
                offset: const Offset(0, 1), color: dark.withOpacity(0.08)),
          ],
          color: white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      child: BlocConsumer<ComparisonAddBloc, ComparisonAddState>(
        listener: (context, state) {},
        builder: (context, state) => WButton(
          onTap: () {
            Navigator.pop(
              context,
              state.count > 0,
            );
          },
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(LocaleKeys.go_to_comparison.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: white)),
              const Spacer(),
              Text(LocaleKeys.added_x_auto.tr(args: ['${state.count}']),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: white.withOpacity(0.72))),
              const SizedBox(width: 4),
              SvgPicture.asset(AppIcons.chevronRight)
            ],
          ),
        ),
      ));
}
