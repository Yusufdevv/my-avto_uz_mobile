import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/z_text_form_field.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberEditPage extends StatefulWidget {
  const PhoneNumberEditPage({super.key});

  @override
  State<PhoneNumberEditPage> createState() => _PhoneNumberEditPageState();
}

class _PhoneNumberEditPageState extends State<PhoneNumberEditPage> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  late TextEditingController phoneController;
  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          backgroundColor: white,
          appBar: const WAppBar(
            title: 'Номер телефона',
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeader(
                  title: LocaleKeys.tel_number.tr(),
                  description: 'Мы отправим код подтверждения на номер телефона'
                  // LocaleKeys.check_number.tr()
                  ,
                ),
                SizedBox(height: SizeConfig.v(49)),
                ZTextFormField(
                  disabledBorderColor: border,
                  onChanged: (onChanged) {
                    setState(() {});
                  },
                  controller: phoneController,
                  prefixIcon: Row(
                    children: [
                      Image.asset(AppImages.flagUzb),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '+998',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  hintText: '00 000 00 00',
                  keyBoardType: TextInputType.number,
                  textInputFormatters: [phoneFormatter],
                ),
                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: WButton(
                    onTap: () {
                      // print(phoneController.text.length);
                      // if (phoneController.text.length == 12) {
                      //   registerBloc.add(RegisterEvent.sendCode(
                      //       phoneController.text.replaceAll('+998', ''),
                      //       onSuccess: (session) {
                      //     Navigator.push(
                      //         context,
                      //         fade(
                      //             page: BlocProvider.value(
                      //           value: registerBloc,
                      //           child: VerificationScreen(
                      //               session: session,
                      //               phone: phoneController.text
                      //                   .replaceAll('+998', '')),
                      //         )));
                      //   }));
                      // } else {}
                    },
                    shadow: [
                      BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: solitude.withOpacity(.12)),
                    ],
                    margin: EdgeInsets.only(
                        bottom: 4 + MediaQuery.of(context).padding.bottom),
                    color: (phoneController.text.isNotEmpty)
                        ? orange
                        : Theme.of(context)
                            .extension<ThemedColors>()!
                            .veryLightGreyToEclipse,
                    text: LocaleKeys.continuee.tr(),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDolphin,
                    ),
                  ),
                ),
                // SizedBox(height: SizeConfig.v(49)),
              ],
            ),
          ),
        ),
      );
}
