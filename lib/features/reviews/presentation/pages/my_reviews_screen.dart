import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/add_review_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/cancelled_review_item.dart';
import 'package:auto/features/reviews/presentation/widgets/my_reviews_item.dart';
import 'package:auto/features/reviews/presentation/widgets/review_bottom_sheet_item.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: WAppBar(
            hasBackButton: true,
            centerTitle: true,
            title: 'Мои отзывы',
            titleStyle: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          // floatingActionButton: WButton(
          //   onTap: () => showModalBottomSheet(
          //     context: context,
          //     isScrollControlled: true,
          //     useRootNavigator: true,
          //     backgroundColor: white,
          //     builder: (context) => SortBottomSheet(
          //       height: MediaQuery.of(context).size.height * 0.3,
          //       hasDivider: false,
          //       title: 'Категория',
          //       children: [
          //         ReviewBottomSheetItem(
          //           icon: AppIcons.lightweightCar,
          //           title: 'Легковые',
          //           onTap: () => Navigator.push(
          //             context,
          //             fade(page: const AddReviewScreen(category: 'Легковые')),
          //           ),
          //         ),
          //         ReviewBottomSheetItem(
          //           icon: AppIcons.truck,
          //           title: 'Коммерческие',
          //           onTap: () => Navigator.push(
          //             context,
          //             fade(
          //                 page:
          //                     const AddReviewScreen(category: 'Коммерческие')),
          //           ),
          //         ),
          //         ReviewBottomSheetItem(
          //           icon: AppIcons.motorcycle,
          //           title: 'Мото',
          //           hasDivider: false,
          //           onTap: () => Navigator.push(
          //             context,
          //             fade(page: const AddReviewScreen(category: 'Мото')),
          //           ),
          //         ),
          //       ],
          //     ),
          //     shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          //     ),
          //   ),
          //   height: 64,
          //   width: 64,
          //   borderRadius: 200,
          //   shadow: [
          //     BoxShadow(
          //       color: orange.withOpacity(0.6),
          //       offset: const Offset(0, 4),
          //       blurRadius: 20,
          //     )
          //   ],
          //   child: SvgPicture.asset(
          //     AppIcons.plus,
          //     color: white,
          //     height: 16,
          //     width: 16,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 50),
                MyReviewsItem(
                  statusText: 'На модерации',
                  statusColor: red,
                  deleteFunction: () {},
                  editFunction: () {},
                  rating: 3.6,
                  reviewTitle: 'Лучший автомобиль за свою цену',
                  carName: 'BMW X7 40i 3.0 AT (340 л.с.) 4WD',
                  commentsCount: 0,
                  date: '24 февраля 2022',
                  imageUrl: 'https://source.unsplash.com/random/2',
                  statusIcon: AppIcons.clock,
                  hasImage: true,
                  viewsCount: 0,
                ),
                const SizedBox(height: 16),
                MyReviewsItem(
                  statusText: 'Черновик',
                  statusColor: blue,
                  statusIcon: AppIcons.document,
                  deleteFunction: () {},
                  editFunction: () {},
                  rating: 3.6,
                  hasImage: true,
                  hasCommented: false,
                  hasViewed: false,
                  date: '24 февраля 2022',
                  carName: 'BMW X7 40i 3.0 AT (340 л.с.) 4WD',
                  reviewTitle: 'Лучший автомобиль за свою цену',
                  imageUrl: 'https://source.unsplash.com/random/2',
                ),
                const SizedBox(height: 16),
                MyReviewsItem(
                  statusText: 'Черновик',
                  statusColor: blue,
                  statusIcon: AppIcons.document,
                  deleteFunction: () {},
                  editFunction: () {},
                  hasCommented: false,
                  hasViewed: false,
                  rating: 3.6,
                  hasImage: false,
                  date: '24 февраля 2022',
                  carName: 'BMW X7 40i 3.0 AT (340 л.с.) 4WD',
                  reviewTitle: 'Лучший автомобиль за свою цену',
                ),
                const SizedBox(height: 16),
                CancelledReviewItem(
                  deleteFunction: () {},
                  editFunction: () {},
                  reviewTitle: 'Лучший автомобиль за свою цену',
                  rating: 3.6,
                  cancellationReason: 'Несодержательный отзыв',
                  carName: 'BMW X7 40i 3.0 AT (340 л.с.) 4WD',
                  hasImage: true,
                  imageUrl: 'https://source.unsplash.com/random/2',
                ),
              ],
            ),
          ),
        ),
      );
}
