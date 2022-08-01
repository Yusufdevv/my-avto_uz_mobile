import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/widgets/container_with_border.dart';
import 'package:auto/features/profile/presentation/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          textWithButton: 'Настройки',
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerWithBorder(
                margin: const EdgeInsets.only(bottom: 12),
                count: 1,
                title: 'Смена пароля',
                onTap: () {},
              ),
              ContainerWithBorder(
                language: 'Русский',
                count: 1,
                title: 'Язык',
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      useRootNavigator: true,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minWidth: MediaQuery.of(context).size.width),
                      builder: (context) => const LanguageBottomSheet());
                },
              ),
            ],
          ),
        ),
      );
}
