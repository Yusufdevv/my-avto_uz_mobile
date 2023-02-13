import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonAddToComparison extends StatelessWidget {
  const ButtonAddToComparison({
    required this.isAddedToComparison,
    required this.id,
    Key? key,
  }) : super(key: key);

  final bool isAddedToComparison;
  final int id;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ComparisonAddBloc, ComparisonAddState>(
          builder: (context, state) {
            final a = state.map[id] ?? isAddedToComparison;
            return WButton(
                onTap: () {
                  if (a) {
                    context
                        .read<ComparisonAddBloc>()
                        .add(ComparisonAddEvent.deleteComparison(id));
                    context.read<ComparisonAddBloc>().add(
                        ComparisonAddEvent.addToMapComparison(
                            id: id, value: false));
                  } else {
                    context
                        .read<ComparisonAddBloc>()
                        .add(ComparisonAddEvent.postComparisonCars(id));
                    context.read<ComparisonAddBloc>().add(
                        ComparisonAddEvent.addToMapComparison(
                            id: id, value: true));
                  }
                },
                padding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
                color: a
                    ? const Color(0xFFFBF2F1)
                    : const Color(0xFFF1F1F5),
                child: Row(
                  children: a
                      ? [
                          SvgPicture.asset(
                            AppIcons.close,
                            key: const ValueKey<int>(1),
                            fit: BoxFit.cover,
                            color: red,
                            height: 28,
                            width: 28,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            LocaleKeys.remove_from_comparison.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(height: 1.4, color: red),
                          ),
                        ]
                      : [
                          SvgPicture.asset(
                            AppIcons.scales,
                            fit: BoxFit.cover,
                            key: const ValueKey<int>(2),
                            color: greyText,
                            height: 28,
                            width: 28,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            LocaleKeys.add_to_comparison.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(height: 1.4, color: greyText),
                          )
                        ],
                ),
              );
          });
}
