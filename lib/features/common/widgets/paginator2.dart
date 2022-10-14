import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

class Paginator2 extends StatelessWidget {
  final FormzStatus status;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;

  const Paginator2({
    required this.status,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    required this.errorWidget,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == FormzStatus.submissionInProgress) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (status ==FormzStatus.submissionFailure) {
      return errorWidget;
    } else {
      return ListView.separated(
        scrollDirection: scrollDirection,
        physics: const BouncingScrollPhysics(),
        padding: padding,
        itemBuilder: (context, index) {
          if (index == itemCount) {
            if (hasMoreToFetch) {
              fetchMoreFunction();
              return const Center(child: CupertinoActivityIndicator());
            } else {
              return const SizedBox();
            }
          }
          return itemBuilder(context, index);
        },
        separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox(),
        itemCount: itemCount + 1,
        shrinkWrap: true,
      );
    }
  }
}

enum PaginatorStatus {
  PAGINATOR_LOADING,
  PAGINATOR_SUCCESS,
  PAGINATOR_ERROR,
  PAGINATOR_INITIAL,
}
