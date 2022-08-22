

import 'package:auto/features/common/widgets/popup_widgets/adaptive_dialog.dart';
import 'package:flutter/material.dart';

void showAdaptiveDialog(
    {required BuildContext context,
      required String title,
      required String bodyText,
      String? positiveButtonTitle,
      required VoidCallback onTapPositive}) {
  showDialog(
      context: context,
      builder: (c) => AdaptiveDialog(
        positiveButtonTitle: positiveButtonTitle,
        title: title,
        bodyText: bodyText,
        onTapPositive: onTapPositive,
      ));
}