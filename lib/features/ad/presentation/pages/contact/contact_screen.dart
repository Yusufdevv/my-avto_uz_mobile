// ignore_for_file: unused_import

import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/call_time_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/contacts_prefix_button.dart';
import 'package:auto/features/ad/presentation/widgets/edit_box_widget.dart';
import 'package:auto/features/ad/presentation/widgets/sms_verification_sheet.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

typedef OnCallTimeChanged = Function({
  required bool isCallTimed,
  String? callTimeFrom,
  String? callTimeTo,
});

class ContactScreen extends StatefulWidget {
  final OnCallTimeChanged onCallTimeChanged;
  final GlobalKey<FormState> formKey;
  final bool showOwnerContacts;
  final bool isWaiting;
  final bool isCallTimed;
  final bool isContactsVerified;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final String? callTimeFrom;
  final String? callTimeTo;
  final Function onGetUserDatas;
  final Function onSubmitPhonePressed;
  final Function(bool) onShowMyContactChanged;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPhoneChanged;

  const ContactScreen({
    required this.onSubmitPhonePressed,
    required this.onPhoneChanged,
    required this.onEmailChanged,
    required this.onNameChanged,
    required this.onShowMyContactChanged,
    required this.onGetUserDatas,
    required this.callTimeTo,
    required this.callTimeFrom,
    required this.isContactsVerified,
    required this.isCallTimed,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.isWaiting,
    required this.showOwnerContacts,
    required this.formKey,
    required this.onCallTimeChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp('[0-9]')},
  );

  void _onAvailableHoursPressed({String? callTimeFrom, String? callTimeTo}) {
    showModalBottomSheet<List<String>>(
      useRootNavigator: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => CallTimeSheet(
        timeFrom: callTimeFrom ?? '',
        timeTo: callTimeTo ?? '',
      ),
    ).then((value) {
      if (value is List) {
        widget.onCallTimeChanged(
            callTimeFrom: value![0].replaceAll(' ', ''),
            callTimeTo: value![1].replaceAll(' ', ''),
            isCallTimed: true);
      } else {
        widget.onCallTimeChanged(isCallTimed: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, postingAdStatee) => Scaffold(
                  body: Form(
                    key: widget.formKey,
                    child: BaseWidget(
                      headerText: LocaleKeys.contact_data.tr(),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SwitcherRowAsButtonAlso(
                                onTap: () {
                                  setState(() {});
                                  widget.onGetUserDatas();
                                },
                                title: LocaleKeys.show_my_contact_data.tr(),
                                value: widget.showOwnerContacts,
                                onChanged: (value) {
                                  setState(() {});
                                  if (!value) {
                                    widget.onShowMyContactChanged(value);
                                  }
                                }),
                            if (widget.isWaiting) ...{
                              const CupertinoActivityIndicator()
                            },
                            const SizedBox(height: 16),
                            WTextField(
                              onTap: () {},
                              validate: (v) {
                                if (v!.isEmpty) {
                                  return LocaleKeys.please_enter_your_name.tr();
                                }
                                return null;
                              },
                              maxLength: 40,
                              hideCounterText: true,
                              controller: widget.nameController,
                              onChanged: widget.onNameChanged,
                              title: LocaleKeys.name.tr(),
                              hintText: LocaleKeys.add_name.tr(),
                              borderRadius: 12,
                              borderColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor,
                              fillColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .fillColor,
                              focusColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .fillColor,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            WTextField(
                              onTap: () {},
                              controller: widget.emailController,
                              onChanged: widget.onEmailChanged,
                              title: 'E-mail',
                              maxLength: 40,
                              hideCounterText: true,
                              hintText: LocaleKeys.add_email.tr(),
                              borderRadius: 12,
                              validate: (value) {
                                if (value?.isEmpty ?? true) {
                                  setState(() {});
                                  return null;
                                }
                                if ((value?.isNotEmpty ?? false) &&
                                    (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.'))) {
                                  return LocaleKeys.please_enter_valid_email
                                      .tr();
                                }
                                return null;
                              },
                              keyBoardType: TextInputType.emailAddress,
                              borderColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor,
                              fillColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .fillColor,
                              focusColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .fillColor,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            WTextField(
                              onTap: () {},
                              onChanged: widget.onPhoneChanged,
                              title: LocaleKeys.tel_number.tr(),
                              controller: widget.phoneController,
                              contentPadding:
                                  const EdgeInsets.only(bottom: 12, top: 12),
                              prefixConstraints:
                                  const BoxConstraints(maxWidth: 52),
                              prefix: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 12, left: 12),
                                    child: Text(
                                      '+998',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              hintText: '_ _  _ _ _  _ _  _ _',
                              borderRadius: 12,
                              borderColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor,
                              errorColor: red,
                              keyBoardType: TextInputType.number,
                              fillColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .fillColor,
                              focusColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .fillColor,
                              textInputFormatters: [phoneFormatter],
                              suffix: ContactsPrefixButton(
                                  isSubmitted: widget.isContactsVerified,
                                  isLoading: widget.isWaiting,
                                  isDisabled:
                                      widget.phoneController.text.length != 12,
                                  onTap: () {
                                    if (widget.phoneController.text.length ==
                                        12) {
                                      widget.onSubmitPhonePressed();
                                    }
                                  }),
                              suffixPadding: const EdgeInsets.all(5),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            SwitcherRowAsButtonAlso(
                                title: LocaleKeys.avialable_hours.tr(),
                                value: widget.isCallTimed,
                                onTap: () {
                                  if (widget.callTimeFrom != null &&
                                      widget.callTimeTo != null) {
                                    widget.onCallTimeChanged(isCallTimed: true);
                                    return;
                                  }
                                  _onAvailableHoursPressed(
                                    callTimeFrom: widget.callTimeFrom,
                                    callTimeTo: widget.callTimeTo,
                                  );
                                },
                                onChanged: (value) {
                                  widget.onCallTimeChanged(isCallTimed: value);
                                }),
                            if (widget.isCallTimed) ...{
                              const SizedBox(height: 4),
                              EditBoxWidget(
                                  text:
                                      '${widget.callTimeFrom}-${widget.callTimeTo}',
                                  onTap: () {
                                    _onAvailableHoursPressed(
                                      callTimeFrom: widget.callTimeFrom,
                                      callTimeTo: widget.callTimeTo,
                                    );
                                  }),
                            },
                            const SizedBox(height: 24),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .snowToNero,
                                  border: Border.all(
                                      width: 1,
                                      color: Theme.of(context)
                                          .extension<ThemedColors>()!
                                          .transparentToNightRider),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                LocaleKeys.incognito_mode.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(color: grey),
                              ),
                            ),
                            SizedBox(
                                height: 60 +
                                    MediaQuery.of(context).viewInsets.bottom),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      );
}
