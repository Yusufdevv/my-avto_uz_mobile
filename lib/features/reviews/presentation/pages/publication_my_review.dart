import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/my_reviews_screen.dart';
import 'package:flutter/material.dart';

class PublicationMyReview extends StatefulWidget {
  const PublicationMyReview({Key? key}) : super(key: key);

  @override
  State<PublicationMyReview> createState() => _PublicationMyReviewState();
}

class _PublicationMyReviewState extends State<PublicationMyReview> {
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController commentTextEditingController =
      TextEditingController();
  bool isSaveDisabled = true;
  bool isPublicationDisabled = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        appBar: WAppBar(
          hasBackButton: true,
          title: 'Добавить отзыв',
          titleStyle:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
          extraActions: [
            WButton(
              onTap: () {
                
              },
              isDisabled: isSaveDisabled,
              color: transparentButton,
              disabledColor: transparentButton,
              text: 'Сохранить',
              textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 13, color: isSaveDisabled ? warmerGrey : orange),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WTextField(
              title: 'Название отзыва',
              titleTextStyle: Theme.of(context).textTheme.headline2,
              borderColor: borderCircular,
              borderRadius: 8,
              controller: nameTextEditingController,
              hintText: 'Введите название',
              margin: const EdgeInsets.all(16),
              hintTextStyle: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w600),
              validate: (p0) {
                if (nameTextEditingController.text.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
              textStyle: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
                if (nameTextEditingController.text.isNotEmpty &&
                    commentTextEditingController.text.isNotEmpty) {
                  setState(() {
                    isPublicationDisabled = false;
                    isSaveDisabled = false;
                  });
                } else if (nameTextEditingController.text.isNotEmpty ||
                    commentTextEditingController.text.isNotEmpty) {
                  setState(() {
                    isPublicationDisabled = true;
                    isSaveDisabled = true;
                  });
                }
              },
              errorColor: red,
            ),
            WTextField(
              title: 'Текст для отзыва',
              titleTextStyle: Theme.of(context).textTheme.headline2,
              borderColor: borderCircular,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: 12,
              controller: commentTextEditingController,
              hintText: 'Введите текст',
              maxLines: 12,
              height: 132,
              textInputAction: TextInputAction.newline,
              hintTextStyle: Theme.of(context).textTheme.headline2,
              textStyle: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w400),
             onChanged: (value) {
                if (nameTextEditingController.text.isNotEmpty &&
                    commentTextEditingController.text.isNotEmpty) {
                  setState(() {
                    isPublicationDisabled = false;
                    isSaveDisabled = false;
                  });
                } else if (nameTextEditingController.text.isNotEmpty ||
                    commentTextEditingController.text.isNotEmpty) {
                  setState(() {
                    isPublicationDisabled = true;
                    isSaveDisabled = true;
                  });
                }
              },
              errorColor: red,
              validate: (p0) {
                if (commentTextEditingController.text.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 12),
            Text(
              'Отзыв должен состоит не менее\n500 символов',
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            WButton(
              margin: const EdgeInsets.all(16),
              color: green,
              shadow: [
                BoxShadow(
                  color: green.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                ),
              ],
              isDisabled: isPublicationDisabled,
              disabledColor: warmerGrey,
              text: 'Опубликовать',
              textStyle: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 14,
                  color: isPublicationDisabled ? dividerColor : white),
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushReplacement(fade(page: const MyReviewsScreen()));
              },
            ),
          ],
        ),
      );
}
