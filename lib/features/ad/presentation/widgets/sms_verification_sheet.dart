import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/profile/presentation/widgets/refresh_button.dart';
import 'package:auto/features/profile/presentation/widgets/time_counter.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsVerificationSheet extends StatefulWidget {
  final String phoneNumber;
  SmsVerificationSheet({required this.phoneNumber, super.key});

  @override
  State<SmsVerificationSheet> createState() => _SmsVerificationSheetState();
}

class _SmsVerificationSheetState extends State<SmsVerificationSheet> {
  late TextEditingController controller;
  bool timeComplete = false;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return Container(
              padding: EdgeInsets.only(
                top: 20,
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).padding.bottom + 42,
              ),
              margin: MediaQuery.of(context).viewInsets,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.confim_number.tr(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Transform.scale(
                          scale: .8,
                          child: SvgPicture.asset(
                            AppIcons.close,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Text(
                    LocaleKeys.enter_password_sms.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        right: 4, left: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: border,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '+998 ${widget.phoneNumber.replaceAll(' ', '')}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        const SizedBox(width: 12),
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .solitudeToBastille,
                                borderRadius: BorderRadius.circular(4)),
                            child: SvgPicture.asset(AppIcons.edit))
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  PinCodeTextField(
                    onChanged: (value) {},
                    controller: controller,
                    length: 6,
                    pinTheme: PinTheme(
                      inactiveColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .solitudeToWhite35,
                      errorBorderColor: red,
                      activeColor: hoursGreen,
                      activeFillColor: hoursGreen,
                      selectedColor: hoursGreen,
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 44,
                      fieldWidth: 50,
                    ),
                    cursorColor: white,
                    keyboardType: TextInputType.number,
                    enableActiveFill: false,
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 4),
                    appContext: context,
                    showCursor: true,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(LocaleKeys.send_via_password.tr(),
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 14,
                                  )),
                      const SizedBox(
                        width: 6,
                      ),
                      if (timeComplete)
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .borderGreyToDark),
                          child: RefreshButton(
                            filteredPhone: widget.phoneNumber,
                            onSucces: () {
                              setState(() {
                                timeComplete = false;
                              });
                            },
                          ),
                        )
                      else
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: orange.withOpacity(0.1)),
                          child: TimeCounter(
                            onComplete: () {
                              setState(() {
                                timeComplete = true;
                              });
                            },
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 40),
                  OrangeButton(
                    shadowColor: orange.withOpacity(0.2),
                    color: orange,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    content: Text(
                      'Подтвердить',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: white,
                          ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
