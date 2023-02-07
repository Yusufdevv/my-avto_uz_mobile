import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddComparisonItem extends StatefulWidget {
  final bool? initialLike;
  final int id;
  final bool isText;
  final bool isGreen;

  const AddComparisonItem({
    required this.id,
    this.initialLike,
    Key? key,
    this.isText = false,
    this.isGreen = false,
  }) : super(key: key);

  @override
  State<AddComparisonItem> createState() => _AddComparisonItemState();
}

class _AddComparisonItemState extends State<AddComparisonItem> {
  bool isLiked = false;

  @override
  void initState() {
    if (widget.initialLike != null) {
      isLiked = widget.initialLike!;
    }
    widget.initialLike ?? super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ComparisonAddBloc, ComparisonAddState>(
        builder: (context, state) => WScaleAnimation(
          onTap: () {
            if (!isLiked) {
              context
                  .read<ComparisonAddBloc>()
                  .add(ComparisonAddEvent.postComparisonCars(widget.id));
              isLiked = true;
            } else {
              context
                  .read<ComparisonAddBloc>()
                  .add(ComparisonAddEvent.deleteComparison(widget.id));
              isLiked = false;
            }
            setState(() {});
          },
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: isLiked
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
                        color: widget.isGreen ? emerald : greyText,
                        height: 28,
                        width: 28,
                      ),
              ),
              if (widget.isText)
                if (widget.isGreen)
                  Text(
                    LocaleKeys.compare.tr(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 12,
                          color: isLiked ? orange : dark,
                        ),
                  )
                else
                  Text(
                    LocaleKeys.compare.tr(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 12,
                          color: isLiked ? orange : const Color(0xff696974),
                        ),
                  )
            ],
          ),
        ),
      );
}
