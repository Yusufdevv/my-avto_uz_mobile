import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/main/presentation/main_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationLeaseScreen extends StatefulWidget {
  const RegistrationLeaseScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationLeaseScreen> createState() =>
      _RegistrationLeaseScreenState();
}

class _RegistrationLeaseScreenState extends State<RegistrationLeaseScreen> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.rent_form.tr(),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              WTextField(
                onChanged: (value) {},
                title: LocaleKeys.name.tr(),
                hintText: LocaleKeys.add_name.tr(),
                borderRadius: 8,
              ),
              const SizedBox(
                height: 16,
              ),
              WTextField(
                onChanged: (value) {},
                title: LocaleKeys.tel_number.tr(),
                prefix: Padding(
                  padding: const EdgeInsets.only(top: 13, left: 10),
                  child: Text(
                    '+998',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                hintText: ' _ _  _ _ _  _ _  _ _',
                borderRadius: 8,
                textInputFormatters: [phoneFormatter],
              )
            ],
          ),
        ),
        bottomNavigationBar: WButton(
          height: 44,
          onTap: () => Navigator.push(context, fade(page: const MainScreen())),
          margin: EdgeInsets.fromLTRB(
              16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
          text: LocaleKeys.submit_applic.tr(),
          shadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20,
                color: orange.withOpacity(0.2)),
          ],
        ),
      );
}
