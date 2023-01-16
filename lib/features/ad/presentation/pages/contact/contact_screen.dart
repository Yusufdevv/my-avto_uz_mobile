import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/call_time_sheet.dart';
import 'package:auto/features/ad/presentation/widgets/sms_verification_sheet.dart';
import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    phoneController = TextEditingController(text: widget.initialPhone);
    nameController = TextEditingController(text: widget.initialName);
    emailController = TextEditingController(text: widget.initialEmail);
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## ### ## ##',
    filter: {'#': RegExp('[0-9]')},
  );
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<PostingAdBloc, PostingAdState>(
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
                          SwitcherRow(
                              title: 'Указать мои контактны данные',
                              value: state.showOwnerContacts ?? false,
                              onChanged: (value) => context
                                  .read<PostingAdBloc>()
                                  .add(PostingAdChooseEvent(
                                      showOwnerContacts: value))),
                          const SizedBox(height: 16),
                          WTextField(
                            controller: nameController,
                            onChanged: (value) {},
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
                          const SizedBox(
                            height: 16,
                          ),
                          WTextField(
                            controller: emailController,
                            onChanged: (value) {},
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
                            onChanged: (value) {
                              setState(() {});
                            },
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
                            suffix: GestureDetector(
                              onTap: () {
                                // if (_formKey.currentState!.validate()) {
                                showModalBottomSheet(
                                  useRootNavigator: true,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  isDismissible: false,
                                  context: context,
                                  builder: (context) => SmsVerificationSheet(
                                    phoneNumber: phoneController.text,
                                  ),
                                );
                                // context.read<PostingAdBloc>().add(
                                //       PostingAdChooseEvent(
                                //         ownerEmail: emailController.text,
                                //         ownerName: nameController.text,
                                //         ownerPhone: phoneController.text,
                                //       ),
                                //     );
                                // }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                    color: (phoneController.text.length == 12)
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
                              value: state.isCallTimed,
                              onTap: () {
                                showModalBottomSheet<List<String>>(
                                  useRootNavigator: true,
                                  isScrollControlled: false,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => CallTimeSheet(
                                    timeFrom: state.callTimeFrom ?? '',
                                    timeTo: state.callTimeTo ?? '',
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
                                print('=>=>=>=> onChangeTriggered <=<=<=<=');
                                context.read<PostingAdBloc>().add(
                                    PostingAdChooseEvent(isCallTimed: value));
                              }),
                          const SizedBox(
                            height: 24,
                          ),
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
      );
}
