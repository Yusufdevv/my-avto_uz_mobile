import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/profile/presentation/widgets/app_bar_child.dart';
import 'package:auto/features/profile/presentation/widgets/camera_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Chat extends StatefulWidget {
  final bool hasChat;

  const Chat({Key? key, required this.hasChat}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late String name =
      'Здравствуйте, уважаемый клиент!  Это служба поддержки auto.uz  Мы к вашим услугам 24 часа в сутки.  Мы общаемся на узбекском, русском и английском языках и ответим на любые интересующие вас вопросы';

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: const WAppBarChild(),
          body: widget.hasChat
              ? Center(
                  child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 0,
                            blurRadius: 16,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 75),
                      padding: const EdgeInsets.all(16),
                      height: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.hello,
                            height: 56,
                          ),
                          const SizedBox(height: 13),
                          Text(
                            'auto.uz',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 24),
                          ),
                          Text(
                            'Здесь вы сможете получить ответы на любые интересующие вас вопросы.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      )),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(4)),
                                color: orange),
                            child: Text(
                              'Здравствуйте',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '18:18',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(AppIcons.checks)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8, bottom: 22),
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.autoUzCircle,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 283,
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 12),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                        bottomLeft: Radius.circular(4)),
                                    color: border),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'auto.uz',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(color: blackRock),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    '18:18',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 4),
                                  SvgPicture.asset(AppIcons.checks)
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.all(8),
            color: white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: WTextField(
                        height: 44,
                        prefix: WScaleAnimation(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                useRootNavigator: true,
                                constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.3,
                                    minWidth:
                                        MediaQuery.of(context).size.width),
                                builder: (context) =>
                                    const CameraBottomSheet());
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: border,
                                borderRadius: BorderRadius.circular(6)),
                            child: SvgPicture.asset(AppIcons.piperClip),
                          ),
                        ),
                        borderRadius: 8,
                        hintText: 'Введите сообщение...',
                        // hintTextStyle: Theme.of(context)
                        //     .textTheme
                        //     .headline1!
                        //     .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                        onChanged: (tmp) {},
                        controller: TextEditingController(),
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        fillColor: borderCircular,
                      ),
                    ),
                    WScaleAnimation(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 18),
                        child: SvgPicture.asset(AppIcons.send),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        ),
      );
}
