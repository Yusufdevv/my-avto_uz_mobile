import 'dart:async';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/pages/pincode_fields.dart';
import 'package:auto/features/profile/presentation/widgets/auth_header.dart';
import 'package:auto/features/profile/presentation/widgets/refresh_button.dart';
import 'package:auto/features/profile/presentation/widgets/time_counter.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum CodePageType { login, register, forgot }

class SmsCodePage extends StatefulWidget {
  // final CodePageType codePageType;
  final String phone;

  const SmsCodePage({Key? key, required this.phone}) : super(key: key);

  @override
  State<SmsCodePage> createState() => _SmsCodePageState();
}

class _SmsCodePageState extends State<SmsCodePage> {
  late TextEditingController _controller;
  late StreamController<ErrorAnimationType> _streamController;
  bool timeComplete = false;

  @override
  void initState() {
    _streamController = StreamController<ErrorAnimationType>();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: WAppBar(
            textWithButton: LocaleKeys.change_password.tr(),
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                AuthHeader(
                  phone: widget.phone,
                  desc: LocaleKeys.enter_password_sms.tr(),
                  title: LocaleKeys.change_password.tr(),
                ),
                const SizedBox(
                  height: 32,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(LocaleKeys.code_confimer.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: grey)),
                ),
                const SizedBox(
                  height: 12,
                ),
                SmsPinCodeFields(
                  onAutoSubmit: () {
                    // authHandle(context.read<RegisterBloc>().state);
                  },
                  controller: _controller,
                  errorAnimationController: _streamController,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.send_via_password.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: grey),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (timeComplete)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: orange.withOpacity(0.1)),
                        child: RefreshButton(
                          filteredPhone: widget.phone,
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
                const SizedBox(
                  height: 36,
                ),
                const Spacer(),
                WButton(
                  margin: EdgeInsets.only(
                      bottom: 15 + MediaQuery.of(context).padding.bottom),
                  // isLoading: state.registerStatus.isSubmissionInProgress ||
                  //     state.loginStatus.isSubmissionInProgress,
                  padding: EdgeInsets.zero,
                  onTap: () {
                    // authHandle(state);
                  },
                  height: 44,
                  borderRadius: 12,
                  textColor: Colors.white,
                  text: LocaleKeys.further.tr(),
                ),
              ],
            ),
          ),
        ),
      );
}
