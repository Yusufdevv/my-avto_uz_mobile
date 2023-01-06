import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddComparisonItem extends StatefulWidget {
  final bool? initialLike;
  final ComparisonAddBloc bloc;
  final int id;

  const AddComparisonItem(
      {required this.bloc, required this.id, this.initialLike, Key? key})
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
  Widget build(BuildContext context) => SizedBox(
        height: 28,
        width: 28,
        child: BlocBuilder<ComparisonAddBloc, ComparisonAddState>(
          bloc: widget.bloc,
          builder: (context, state) => GestureDetector(
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
              ComparisonAddEvent.postComparisonCars(widget.id);
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
                    )
                  : SvgPicture.asset(
                      AppIcons.scale,
                      fit: BoxFit.cover,
                      key: const ValueKey<int>(2),
                    ),
            ),
          ),
        ),
      );
}
