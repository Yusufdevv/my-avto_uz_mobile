import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:flutter/material.dart';

class PersonalDataItem extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  const PersonalDataItem({required this.title, required this.onChanged, required this.controller, required this.hintText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 8, top: 16),
    child: Row(
      children: [
        Expanded(child: Text(title, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),)),
        Expanded(flex: 3, child: ZTextFormField(onChanged: onChanged, controller: controller, hintText: hintText,)),
      ],
    ),
  );
}
