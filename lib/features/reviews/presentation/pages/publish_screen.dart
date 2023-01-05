import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/pages/my_reviews_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/next_container.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  final TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(23, 23, 37, 0.08),
              offset: Offset(0, 8),
              blurRadius: 24,
            )
          ]),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            titleSpacing: 8,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(AppIcons.appbar_back),
                    ),
                    Text(
                      LocaleKeys.add_review.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: LightThemeColors.headline5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: LightThemeColors.appBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Название отзыва',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff92929D),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF4F4F4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Название отзыва',
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Text(
                'Текст для отзыва',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff92929D),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 132,
                width: double.maxFinite,
                child: TextField(
                  maxLines: 10,
                  maxLength: 500,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF4F4F4),
                    counter: const SizedBox(
                      height: 34,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(
                          'Отзыв должен состоит не менее\n500 символов',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7F878F),
                          ),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'Введите текст',
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyReviewsScreen(),
                  ),
                ),
                child: nexContainer(const Color(0xff64C59E), 'Опубликовать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
