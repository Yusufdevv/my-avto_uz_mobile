import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:flutter/material.dart';

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
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    if (isRequired) ...{
                      TextSpan(
                        text: '*',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
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
                  onTap: onTap,
                  onChanged: onChanged,
                  controller: controller,
                  hintText: hintText,
                  hintTextStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                          fontSize: 14,
                          color: warmerGrey,
                          fontWeight: FontWeight.w400),
                  textStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                )),
          ],
        ),
      );
}
