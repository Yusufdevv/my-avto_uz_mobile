import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalDataItemm extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool isRequired;

  const PersonalDataItemm(
      {required this.title,
      required this.onTap,
      required this.onChanged,
      required this.controller,
      required this.hintText,
      this.isRequired = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.5),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    if (isRequired) ...{
                      Text(
                        '*',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: orange,
                                ),
                      ),
                    }
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: ZTextFormField(
                  maxLength: 40,
                  hideCounterText: true,
                  onTap: onTap,
                  onChanged: onChanged,
                  controller: controller,
                  hintText: hintText,
                  textInputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[\da-zA-Z!@#$&*~]')),
                  ],
                  hintTextStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          fontSize: 14,
                          color: warmerGrey,
                          fontWeight: FontWeight.w400),
                  textStyle: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                )),
          ],
        ),
      );
}
