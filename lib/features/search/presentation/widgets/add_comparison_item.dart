import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddComparisonItem extends StatelessWidget {
  final bool initialLike;
  final int id;
  final bool isText;
  final bool isGreen;

  const AddComparisonItem({
    required this.id,
    required this.initialLike,
    Key? key,
    this.isText = false,
    this.isGreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ComparisonAddBloc, ComparisonAddState>(
          listener: (context, state) {},
          builder: (context, state) {
            final a = state.map[id] ?? initialLike;
            return WScaleAnimation(
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
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child:a
                        ? SvgPicture.asset(
                            AppIcons.scales,
                            key: const ValueKey<int>(1),
                            fit: BoxFit.cover,
                            color: orange,
                            height: 28,
                            width: 28,
                          )
                        : SvgPicture.asset(
                            AppIcons.scales,
                            fit: BoxFit.cover,
                            key: const ValueKey<int>(2),
                            color: isGreen ? emerald : greyText,
                            height: 28,
                            width: 28,
                          ),
                  ),
                  if (isText)
                    if (isGreen)
                      Text(
                        LocaleKeys.compare.tr(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 12,
                              color:a ? orange : dark,
                            ),
                      )
                    else
                      Text(
                        LocaleKeys.compare.tr(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 12,
                              color:a
                                  ? orange
                                  : const Color(0xff696974),
                            ),
                      )
                ],
              ),
            );
          });
}
