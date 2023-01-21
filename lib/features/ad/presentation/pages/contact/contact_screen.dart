import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/contacts_usecase.dart';
import 'package:auto/features/ad/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/call_time_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/contacts_prefix_button.dart';
import 'package:auto/features/ad/presentation/widgets/sms_verification_sheet.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/switcher_row_as_button_also.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
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
  late ContactsBloc contactsBloc;

  @override
  void initState() {
    contactsBloc = ContactsBloc(
      emailInitial: widget.initialPhone,
      nameInitial: widget.initialName,
      phoneInitial: widget.initialEmail,
      userRepository: AuthRepository(),
      contactsUseCase:
          ContactsUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      verifyCodeUseCase: VerifyCodeUseCase(),
    );
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
  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: contactsBloc,
        child: CustomScreen(
          child: KeyboardDismisser(
            child: BlocBuilder<PostingAdBloc, PostingAdState>(
              builder: (context, postingAdState) =>
                  BlocConsumer<ContactsBloc, ContactsState>(
                listener: (context, state) {
                  if (state.isSubmitted) {
                    context.read<PostingAdBloc>().add(PostingAdChooseEvent(
                      
                          ownerEmail: state.userModel!.email,
                          ownerName: state.userModel!.fullName,
                          ownerPhone: state.userModel!.phoneNumber,
                        ));
                  }

                  if (state.status == FormzStatus.submissionFailure ||
                      state.getUserStatus == FormzStatus.submissionFailure) {
                    context.read<ShowPopUpBloc>().add(
                          ShowPopUp(
                            message: state.toastMessage ?? '',
                            isSucces: false,
                            dismissible: false,
                          ),
                        );
                  }
                },
                builder: (context, state) => Scaffold(
                  body: Form(
                    key: _formKey,
                    child: BaseWidget(
                      headerText: 'Контактные данные',
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(16),
                              children: [
                                SwitcherRowAsButtonAlso(
                                    onTap: () {
                                      contactsBloc.add(
                                          ContactsGetUserInfoAsContactsEvent());
                                    },
                                    title: 'Указать мои контактны данные',
                                    value: postingAdState.showOwnerContacts,
                                    onChanged: (value) {
                                      if (!value) {
                                        contactsBloc.add(
                                            ContactsRefreshControllersEvent());
                                      }
                                      print(
                                          '=>=>=>=> onchanged after if $value <=<=<=<=');
                                      hidePopUp();
                                      context.read<PostingAdBloc>().add(
                                          PostingAdChooseEvent(
                                              showOwnerContacts: value,
                                              isContactsVerified:
                                                  !value ? value : null));
                                    }),
                                if (state.getUserStatus ==
                                    FormzStatus.submissionInProgress) ...{
                                  const CupertinoActivityIndicator()
                                },
                                const SizedBox(height: 16),
                                WTextField(
                                  onTap: hidePopUp,
                                  controller: state.nameController,
                                  onChanged: (value) => context
                                      .read<PostingAdBloc>()
                                      .add(PostingAdChooseEvent(
                                          ownerName: value)),
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
                                ),
                                const SizedBox(height: 16),
                                WTextField(
                                  onTap: hidePopUp,
                                  controller: state.emailController,
                                  onChanged: (value) => context
                                      .read<PostingAdBloc>()
                                      .add(PostingAdChooseEvent(
                                          ownerEmail: value)),
                                  title: 'E-mail',
                                  maxLength: 40,
                                  hideCounterText: true,
                                  hintText: 'Введите электронную почту',
                                  borderRadius: 12,
                                  validate: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.')) {
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
                                  onChanged: (value) => context
                                      .read<PostingAdBloc>()
                                      .add(PostingAdChooseEvent(
                                          ownerName: value)),
                                  title: 'Номер телефона',
                                  controller: state.phoneController,
                                  prefix: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 8, top: 13),
                                    child: Text(
                                      '+998',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
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
                                          postingAdState.isContactsVerified ||
                                              postingAdState.showOwnerContacts,
                                      isLoading: state.status ==
                                          FormzStatus.submissionInProgress,
                                      isDisabled:
                                          state.phoneController.text.length !=
                                              12,
                                      onTap: () {
                                        print(
                                            '=>=>=>=> send code pressed <=<=<=<=');
                                        if (_formKey.currentState!.validate()) {
                                          contactsBloc.add(
                                              ContactsSendCodeEvent(
                                                  phone: state
                                                      .phoneController.text,
                                                  onSuccess: (session) {
                                                    showModalBottomSheet<
                                                            dynamic>(
                                                        useRootNavigator: true,
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        context: context,
                                                        builder: (context) =>
                                                            BlocProvider.value(
                                                              value:
                                                                  contactsBloc,
                                                              child: SmsVerificationSheet(
                                                                  session:
                                                                      session,
                                                                  phoneNumber: state
                                                                      .phoneController
                                                                      .text),
                                                            )).then((value) {
                                                      print(
                                                          '=>=>=>=> then triggered <=<=<=<=');
                                                      if (value is bool) {
                                                        print(
                                                            '=>=>=>=> is bool <=<=<=<=');
                                                        context
                                                            .read<
                                                                PostingAdBloc>()
                                                            .add(
                                                              PostingAdChooseEvent(
                                                                isContactsVerified:
                                                                    value,
                                                                ownerEmail: state
                                                                    .emailController
                                                                    .text,
                                                                ownerName: state
                                                                    .nameController
                                                                    .text,
                                                                ownerPhone: state
                                                                    .phoneController
                                                                    .text,
                                                              ),
                                                            );
                                                      } else if (value
                                                          is String) {
                                                        print(
                                                            '=>=>=>=> is string <=<=<=<=');
                                                        context
                                                            .read<
                                                                PostingAdBloc>()
                                                            .add(
                                                              PostingAdChooseEvent(
                                                                isContactsVerified:
                                                                    false,
                                                                ownerEmail: state
                                                                    .emailController
                                                                    .text,
                                                                ownerName: state
                                                                    .nameController
                                                                    .text,
                                                                ownerPhone: state
                                                                    .phoneController
                                                                    .text,
                                                              ),
                                                            );
                                                        context
                                                            .read<
                                                                ShowPopUpBloc>()
                                                            .add(ShowPopUp(
                                                                message: value
                                                                    .toString(),
                                                                isSucces: false,
                                                                dismissible:
                                                                    false));
                                                      }
                                                      print(
                                                          '=>=>=>=> then completed <=<=<=<=');
                                                    });
                                                  }));
                                        }
                                      }),
                                  suffixPadding: const EdgeInsets.all(5),
                                ),
                                const SizedBox(height: 16),
                                SwitcherRowAsButtonAlso(
                                    title: 'Доступные часы',
                                    value: postingAdState.isCallTimed,
                                    onTap: () {
                                      hidePopUp();
                                      showModalBottomSheet<List<String>>(
                                        useRootNavigator: true,
                                        isScrollControlled: false,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) => CallTimeSheet(
                                          timeFrom:
                                              postingAdState.callTimeFrom ?? '',
                                          timeTo:
                                              postingAdState.callTimeTo ?? '',
                                        ),
                                      ).then((value) {
                                        if (value is List) {
                                          context.read<PostingAdBloc>().add(
                                              PostingAdChooseEvent(
                                                  callTimeFrom: value?[0],
                                                  callTimeTo: value?[1],
                                                  isCallTimed: true));
                                        } else {
                                          context.read<PostingAdBloc>().add(
                                              PostingAdChooseEvent(
                                                  isCallTimed: false));
                                        }
                                      });
                                    },
                                    onChanged: (value) {
                                      hidePopUp();
                                      print(
                                          '=>=>=>=> onChangeTriggered <=<=<=<=');
                                      context.read<PostingAdBloc>().add(
                                          PostingAdChooseEvent(
                                              isCallTimed: value));
                                    }),
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
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
