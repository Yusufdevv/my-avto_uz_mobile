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

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

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

  void _onAvailableHoursPressed(PostingAdState postingAdState) {
    showModalBottomSheet<List<String>>(
      useRootNavigator: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => CallTimeSheet(
        timeFrom: postingAdState.callTimeFrom ?? '',
        timeTo: postingAdState.callTimeTo ?? '',
      ),
    ).then((value) {
      if (value is List) {
        context.read<PostingAdBloc>().add(PostingAdChooseEvent(
            callTimeFrom: value?[0].replaceAll(' ', ''),
            callTimeTo: value?[1].replaceAll(' ', ''),
            isCallTimed: true));
      } else {
        context
            .read<PostingAdBloc>()
            .add(PostingAdChooseEvent(isCallTimed: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, postingAdState) => Scaffold(
                  body: Form(
                    key: postingAdState.contactsFormKey,
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
                                  context
                                      .read<PostingAdBloc>()
                                      .add(PostingAdGetUserDataEvent());
                                },
                                title: LocaleKeys.show_my_contact_data.tr(),
                                value: postingAdState.showOwnerContacts,
                                onChanged: (value) {
                                  setState(() {});
                                  if (!value) {
                                    context
                                        .read<PostingAdBloc>()
                                        .add(PostingAdClearControllersEvent());

                                    context.read<PostingAdBloc>().add(
                                          PostingAdChooseEvent(
                                            showOwnerContacts: value,
                                            isContactsVerified: value,
                                          ),
                                        );
                                  }
                                }),
                            if (postingAdState.status ==
                                FormzStatus.submissionInProgress) ...{
                              const CupertinoActivityIndicator()
                            },
                            const SizedBox(height: 16),
                            WTextField(
                              onTap: () {},
                              validate: (v) {
                                log('::::::::::  NAME INPUT VALUE:  ${postingAdState.nameController.text}  ::::::::::');
                                log('::::::::::  NAME INPUT VALUE:  $v  ::::::::::');
                                log('::::::::::  NAME INPUT VALUE:  ${postingAdState.ownerName}  ::::::::::');
                                if (v!.isEmpty) {
                                  return LocaleKeys.please_enter_your_name.tr();
                                }
                                return null;
                              },
                              maxLength: 40,
                              hideCounterText: true,
                              controller: postingAdState.nameController,
                              onChanged: (value) {
                                final v = postingAdState.isContactsVerified
                                    ? false
                                    : null;
                                context
                                    .read<PostingAdBloc>()
                                    .add(PostingAdChooseEvent(
                                      ownerName: value,
                                      // isContactsVerified: v,
                                      showOwnerContacts: v,
                                    ));
                              },
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
                              controller: postingAdState.emailController,
                              onChanged: (value) {
                                context.read<PostingAdBloc>().add(
                                    PostingAdChooseEvent(ownerEmail: value));
                              },
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
                              onChanged: (value) {
                                final v = postingAdState.isContactsVerified
                                    ? false
                                    : null;
                                context.read<PostingAdBloc>().add(
                                      PostingAdChooseEvent(
                                          ownerName: value,
                                          isContactsVerified: v,
                                          showOwnerContacts: v),
                                    );
                              },
                              title: LocaleKeys.tel_number.tr(),
                              controller: postingAdState.phoneController,
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
                                  isSubmitted:
                                      postingAdState.isContactsVerified,
                                  isLoading: postingAdState.status ==
                                      FormzStatus.submissionInProgress,
                                  isDisabled: postingAdState
                                          .phoneController.text.length !=
                                      12,
                                  onTap: () {
                                    if (postingAdState
                                            .phoneController.text.length ==
                                        12) {
                                      context.read<PostingAdBloc>().add(
                                          PostingAdSendCodeEvent(
                                              phone: postingAdState
                                                  .phoneController.text,
                                              onSuccess: (session) {
                                                showModalBottomSheet<dynamic>(
                                                    useRootNavigator: true,
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    isDismissible: false,
                                                    context: context,
                                                    builder: (context) =>
                                                        SmsVerificationSheet(
                                                            session: session,
                                                            phoneNumber:
                                                                postingAdState
                                                                    .phoneController
                                                                    .text)).then(
                                                    (value) {
                                                  if (value is bool) {
                                                    context
                                                        .read<PostingAdBloc>()
                                                        .add(
                                                          PostingAdChooseEvent(
                                                            isContactsVerified:
                                                                value,
                                                            ownerEmail:
                                                                postingAdState
                                                                    .emailController
                                                                    .text,
                                                            ownerName:
                                                                postingAdState
                                                                    .nameController
                                                                    .text,
                                                            ownerPhone:
                                                                postingAdState
                                                                    .phoneController
                                                                    .text,
                                                          ),
                                                        );
                                                  } else if (value is String) {
                                                    context
                                                        .read<PostingAdBloc>()
                                                        .add(
                                                          PostingAdChooseEvent(
                                                            isContactsVerified:
                                                                false,
                                                            ownerEmail:
                                                                postingAdState
                                                                    .emailController
                                                                    .text,
                                                            ownerName:
                                                                postingAdState
                                                                    .nameController
                                                                    .text,
                                                            ownerPhone:
                                                                postingAdState
                                                                    .phoneController
                                                                    .text,
                                                          ),
                                                        );
                                                    context
                                                        .read<ShowPopUpBloc>()
                                                        .add(ShowPopUp(
                                                          message:
                                                              value.toString(),
                                                          status:
                                                              PopStatus.error,
                                                        ));
                                                  }
                                                });
                                              }));
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
                                value: postingAdState.isCallTimed,
                                onTap: () {
                                  if (postingAdState.callTimeFrom != null &&
                                      postingAdState.callTimeTo != null) {
                                    context.read<PostingAdBloc>().add(
                                        PostingAdChooseEvent(
                                            isCallTimed: true));
                                    return;
                                  }
                                  _onAvailableHoursPressed(postingAdState);
                                },
                                onChanged: (value) {
                                  context.read<PostingAdBloc>().add(
                                      PostingAdChooseEvent(isCallTimed: value));
                                }),
                            if (postingAdState.isCallTimed) ...{
                              const SizedBox(height: 4),
                              EditBoxWidget(
                                  text:
                                      '${postingAdState.callTimeFrom}-${postingAdState.callTimeTo}',
                                  onTap: () {
                                    _onAvailableHoursPressed(postingAdState);
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
