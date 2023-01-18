import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddComparisonItem extends StatefulWidget {
  final bool? initialLike;
  final int id;
  final Color? color;

  const AddComparisonItem(
      {required this.id, this.initialLike, Key? key, this.color})
      : super(key: key);

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
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => context.read<ComparisonAddBloc>(),
        child: SizedBox(
          height: 28,
          width: 28,
          child: BlocBuilder<ComparisonAddBloc, ComparisonAddState>(
            bloc: context.read<ComparisonAddBloc>(),
            builder: (context, state) => GestureDetector(
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
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: isLiked
                    ? SvgPicture.asset(
                        AppIcons.scalesRed,
                        key: const ValueKey<int>(1),
                        fit: BoxFit.cover,
                        color: widget.color,
                      )
                    : SvgPicture.asset(
                        AppIcons.scale,
                        fit: BoxFit.cover,
                        key: const ValueKey<int>(2),
                      ),
              ),
            ),
          ),
        ),
      );
}
