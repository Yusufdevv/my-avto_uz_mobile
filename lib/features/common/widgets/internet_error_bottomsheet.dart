import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InternetErrorBottomSheet extends StatefulWidget {
  final VoidCallback onTap;

  const InternetErrorBottomSheet({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<InternetErrorBottomSheet> createState() =>
      _InternetErrorBottomSheetState();
}

class _InternetErrorBottomSheetState extends State<InternetErrorBottomSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppIcons.inet_error,
                width: 130,
                height: 130,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                LocaleKeys.net_conntect_fail.tr(),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: dark,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                LocaleKeys.problem_with_net_repeat_again.tr(),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: const Color(0xff696974),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                height: 48,
              ),
              WButton(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    isLoading = false;
                  });
                },
                color: orange,
                child: Center(
                  child: isLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: white,
                          ),
                        )
                      : Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset(
                              AppIcons.refresh1,
                              color: white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              LocaleKeys.repeat.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const Spacer(),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      );
}
