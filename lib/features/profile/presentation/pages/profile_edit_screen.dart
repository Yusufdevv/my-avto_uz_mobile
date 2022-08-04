import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/profile/presentation/widgets/camera_bottom_sheet.dart';
import 'package:auto/features/profile/presentation/widgets/title_text_field_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(textWithButton: 'Мой профиль'),
        body: KeyboardDismisser(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: white,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: WScaleAnimation(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              useRootNavigator: true,
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.3,
                                  minWidth: MediaQuery.of(context).size.width),
                              builder: (context) => const CameraBottomSheet());
                        },
                        child: Column(
                          children: [
                            CachedImage(
                                height: 80,
                                width: 80,
                                borderRadius: BorderRadius.circular(40),
                                fit: BoxFit.cover,
                                imageUrl:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_mNmpqHOTakNgIaKR5bxJFfkUtiLdPBXPMw&usqp=CAU'),
                            const SizedBox(height: 8),
                            Text(
                              'Изменить фото',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: blue),
                            ),
                          ],
                        )),
                  ),
                  const TitleTextFieldTop(title: 'Имя'),
                  WTextField(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    borderRadius: 8,
                    hintText: 'Джасурбек',
                    hintTextStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                    onChanged: (tmp) {},
                    controller: TextEditingController(),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    fillColor: borderCircular,
                  ),
                  const TitleTextFieldTop(title: 'Фамилия'),
                  WTextField(
                    borderRadius: 8,
                    hintText: 'Нарзуллаев',
                    hintTextStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                    onChanged: (tmp) {},
                    controller: TextEditingController(),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    fillColor: borderCircular,
                  ),
                  const TitleTextFieldTop(title: 'Регион'),
                  WTextField(
                    suffix: SvgPicture.asset(AppIcons.chevronRight),
                    borderRadius: 8,
                    hintText: 'г. Ташкент',
                    hintTextStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                    onChanged: (tmp) {},
                    controller: TextEditingController(),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    fillColor: borderCircular,
                  ),
                  const TitleTextFieldTop(title: 'Email'),
                  WTextField(
                    suffix: SvgPicture.asset(AppIcons.lock),
                    borderRadius: 8,
                    hintText: 'boss@auto.uz',
                    hintTextStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                    onChanged: (tmp) {},
                    controller: TextEditingController(),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    fillColor: borderCircular,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
