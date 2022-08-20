import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/pages/new_password_screen.dart';
import 'package:auto/features/login/presentation/widgets/add_photo_item.dart';
import 'package:auto/features/login/presentation/widgets/login_header_widget.dart';
import 'package:auto/features/login/presentation/widgets/personal_data_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late TextEditingController passwordController;
  late TextEditingController regionController;
  late TextEditingController emailController;
  @override
  void initState() {
    passwordController = TextEditingController();
    regionController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    passwordController.dispose();
    regionController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
    child: Scaffold(
      appBar: const WAppBar(
        title: 'Регистрация',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(
             child: ListView(
               children: [

                 const LoginHeader(title: 'Персональные данные', description: 'Придумайте пароль для входа', hasSizedBox: false,),
                 const SizedBox(height: 36,),
                 const AddPhotoItem(),
                 PersonalDataItem(title: 'Имя', controller: passwordController, hintText: 'Пароль', onChanged: (String value) { setState((){}); },),
                 PersonalDataItem(title: 'Регион', controller: regionController, hintText: 'Выберите регион', onChanged: (String value) { setState((){}); },),
                 PersonalDataItem(title: 'Email', controller: emailController, hintText: 'Пароль', onChanged: (String value) { setState((){}); },),
                 const SizedBox(height: 10,)
               ],
             ),
           ),
           WButton(
              onTap: () => Navigator.push(context, fade(page: const NewPasswordScreen())),
              shadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Theme.of(context).extension<ThemedColors>()!.transparentToSolitude12
                )
              ],
              margin: const EdgeInsets.only(bottom: 20),
              color:(passwordController.text.isNotEmpty && regionController.text.isNotEmpty && emailController.text.isNotEmpty)?orange : Theme.of(context)
                  .extension<ThemedColors>()!
                  .veryLightGreyToEclipse ,
              text: 'Продолжить',
              border: Border.all(
                width: 1,
                color:   Theme.of(context)
                    .extension<ThemedColors>()!
                    .whiteToDolphin ,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
