import 'package:auto/features/common/widgets/w_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

void showCupertinoDatePicker(
    BuildContext context, Function(DateTime) datePicked) {
  FocusScope.of(context).unfocus();
  showModalBottomSheet(
    useRootNavigator: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    isScrollControlled: false,
    context: context,
    builder: (_) => WBottomSheet(
      contentPadding: const EdgeInsets.all(20),
      children: [
        DateTimePickerWidget(
          maxDateTime: DateTime.now(),
          locale: DateTimePickerLocale.ru,
          dateFormat: 'dd MMMM yyyy',
          onCancel: () {},
          onConfirm: (value, _) {
            datePicked(value);
          },
        ),
      ],
    ),
  );
}
