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
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactScreen extends StatefulWidget {
  final String initialPhone;
  final String initialEmail;
  final String initialName;

  const ContactScreen(
      {required this.initialEmail,
      required this.initialName,
      required this.initialPhone,
      Key? key})
      : super(key: key);

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

  void hidePopUp() {
    context.read<ShowPopUpBloc>().add(HidePopUp());
  }

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp('[0-9]')},
  );
  final _formKey = GlobalKey<FormState>();

  void _onAvailableHoursPressed(PostingAdState postingAdState) {
    hidePopUp();
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
        child: BlocConsumer<PostingAdBloc, PostingAdState>(
            listener: (context, state) {
              if (state.toastMessage != null &&
                  state.toastMessage!.isNotEmpty) {
                context.read<ShowPopUpBloc>().add(
                      ShowPopUp(
                        message: state.toastMessage ?? '',
                        isSucces: false,
                        dismissible: false,
                      ),
                    );
              }
            },
            builder: (context, postingAdState) => Scaffold(
                  body: Form(
                    key: _formKey,
                    child: BaseWidget(
                      headerText: 'Контактные данные',
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SwitcherRowAsButtonAlso(
                                onTap: () {
                                  hidePopUp();
                                  context
                                      .read<PostingAdBloc>()
                                      .add(PostingAdGetUserDataEvent());
                                },
                                title: 'Указать мои контактны данные',
                                value: postingAdState.showOwnerContacts,
                                onChanged: (value) {
                                  if (!value) {
                                    context
                                        .read<PostingAdBloc>()
                                        .add(PostingAdClearControllersEvent());

                                    hidePopUp();
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
                              onTap: hidePopUp,
                              controller: postingAdState.nameController,
                              onChanged: (value) {
                                final v = postingAdState.isContactsVerified
                                    ? false
                                    : null;
                                context
                                    .read<PostingAdBloc>()
                                    .add(PostingAdChooseEvent(
                                      ownerName: value,
                                      isContactsVerified: v,
                                      showOwnerContacts: v,
                                    ));
                              },
                              maxLength: 40,
                              hideCounterText: true,
                              title: 'Имя',
                              hintText: 'Введите имя',
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
                                  .headline1!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            WTextField(
                              onTap: hidePopUp,
                              controller: postingAdState.emailController,
                              onChanged: (value) => context
                                  .read<PostingAdBloc>()
                                  .add(PostingAdChooseEvent(ownerEmail: value)),
                              title: 'E-mail',
                              maxLength: 40,
                              hideCounterText: true,
                              hintText: 'Введите электронную почту',
                              borderRadius: 12,
                              validate: (value) {
                                if ((value?.isNotEmpty ?? false) &&
                                    (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.'))) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
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
                                  .headline1!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            WTextField(
                              validate: (v) {
                                if (v?.length != 12) {
                                  return 'Enter valid phone number';
                                }
                                return null;
                              },
                              onTap: hidePopUp,
                              onChanged: (value) {
                                final v = postingAdState.isContactsVerified
                                    ? false
                                    : null;
                                context.read<PostingAdBloc>().add(
                                      PostingAdChooseEvent(
                                        ownerName: value,
                                        isContactsVerified: v,
                                        showOwnerContacts: v,
                                      ),
                                    );
                              },
                              title: 'Номер телефона',
                              controller: postingAdState.phoneController,
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 8, top: 13),
                                child: Text(
                                  '+998',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                              hintText: '_ _  _ _ _  _ _  _ _',
                              borderRadius: 12,
                              borderColor: Theme.of(context)
                                  .extension<WTextFieldStyle>()!
                                  .borderColor,
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
                                    hidePopUp();
                                    if (_formKey.currentState!.validate()) {
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
                                                            phoneNumber: postingAdState
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
                                                    print(
                                                        '=> => => =>      Before show pup up:     <= <= <= <=');
                                                    context
                                                        .read<ShowPopUpBloc>()
                                                        .add(ShowPopUp(
                                                            message: value
                                                                .toString(),
                                                            isSucces: false,
                                                            dismissible:
                                                                false));
                                                  }
                                                });
                                              }));
                                    }
                                  }),
                              suffixPadding: const EdgeInsets.all(5),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            SwitcherRowAsButtonAlso(
                                title: 'Доступные часы',
                                value: postingAdState.isCallTimed,
                                onTap: () {
                                  hidePopUp();
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
                                  hidePopUp();
                                  context.read<PostingAdBloc>().add(
                                      PostingAdChooseEvent(isCallTimed: value));
                                }),
                            if (postingAdState.isCallTimed) ...{
                              const SizedBox(height: 4),
                              EditBoxWidget(
                                  text:
                                      '${postingAdState.callTimeFrom}-${postingAdState.callTimeTo}',
                                  onTap: () {
                                    hidePopUp();

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
                                'Если вы включаете этот режим ваш контакный номер не будеть отображаться в объявление',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(color: grey),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      );
}
