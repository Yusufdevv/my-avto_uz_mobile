import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/verification/verification_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/call_time_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/sms_verification_sheet.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// https://panel.avto.uz/api/v1/users/detail/
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
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late VerificationBloc verificationBloc;

  @override
  void initState() {
    phoneController = TextEditingController(text: widget.initialPhone);
    nameController = TextEditingController(text: widget.initialName);
    emailController = TextEditingController(text: widget.initialEmail);
    verificationBloc = VerificationBloc(
      sendCodeUseCase: SendCodeUseCase(),
      verifyCodeUseCase: VerifyCodeUseCase(),
    );
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    nameController.dispose();
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
        value: verificationBloc,
        child: KeyboardDismisser(
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, postingAdState) =>
                BlocConsumer<VerificationBloc, VerificationState>(
              listener: (context, verificationState) {
                if (verificationState.status == FormzStatus.submissionFailure) {
                  context.read<ShowPopUpBloc>().add(
                        ShowPopUp(
                          message: verificationState.toastMessage ?? '',
                          isSucces: false,
                          dismissible: false,
                        ),
                      );
                }
                if (verificationState.status == FormzStatus.submissionSuccess) {
                  showModalBottomSheet(
                      useRootNavigator: true,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      context: context,
                      builder: (context) => BlocProvider.value(
                            value: verificationBloc,
                            child: SmsVerificationSheet(
                                phoneNumber: phoneController.text),
                          ));
                }
              },
              builder: (context, verificationState) => Scaffold(
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
                              SwitcherRow(
                                  title: 'Указать мои контактны данные',
                                  value:
                                      postingAdState.showOwnerContacts ?? false,
                                  onChanged: (value) {
                                    hidePopUp();
                                    context.read<PostingAdBloc>().add(
                                        PostingAdChooseEvent(
                                            showOwnerContacts: value));
                                  }),
                              const SizedBox(height: 16),
                              WTextField(
                                onTap: hidePopUp,
                                controller: nameController,
                                onChanged: (value) => context
                                    .read<PostingAdBloc>()
                                    .add(
                                        PostingAdChooseEvent(ownerName: value)),
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
                                controller: emailController,
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
                              const SizedBox(
                                height: 16,
                              ),
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
                                    .add(
                                        PostingAdChooseEvent(ownerName: value)),
                                title: 'Номер телефона',
                                controller: phoneController,
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
                                suffix: WButton(
                                  isLoading: verificationState.status ==
                                      FormzStatus.submissionInProgress,
                                  isDisabled:
                                      (postingAdState.ownerPhone?.length ??
                                              0) !=
                                          12,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      verificationBloc.add(
                                          VerificationSendCodeEvent(
                                              phone: phoneController.text));
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                        color:
                                            (phoneController.text.length == 12)
                                                ? orange
                                                : Theme.of(context)
                                                    .extension<ThemedColors>()!
                                                    .veryLightGreyToEclipse,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        'Подтвердить',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: white),
                                      ),
                                    ),
                                  ),
                                ),
                                suffixPadding: const EdgeInsets.all(5),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SwitcherRow(
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
                                        timeTo: postingAdState.callTimeTo ?? '',
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
      );
}
