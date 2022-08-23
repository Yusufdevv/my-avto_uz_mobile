import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class Paginator extends StatelessWidget {
  final FormzStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;

  const Paginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    required this.errorWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus==FormzStatus.submissionInProgress) {
      return const Center(child: CircularProgressIndicator());
    } else if (paginatorStatus==FormzStatus.submissionFailure) {
      return errorWidget;
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          if(index == itemCount) {
            if(hasMoreToFetch) {
              fetchMoreFunction();
              return const CircularProgressIndicator();
            } else {
              return const SizedBox();
            }
          }
          return itemBuilder(context, index);
        },
        itemCount: itemCount + 1,
      );
    }
  }
}

