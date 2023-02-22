import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/edit_delete_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleReviewScreen extends StatelessWidget {
  const SingleReviewScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(AppIcons.appbar_back),
          ),
          elevation: 24,
          shadowColor: const Color.fromRGBO(23, 23, 37, 0.08),
          title: const Text(
            'Отзыв',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            SvgPicture.asset(
              AppIcons.share,
              color: const Color(0xff92929D),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  context: context,
                  builder: (context) => const EditDeleteBottomSheet(),
                );
              },
              behavior: HitTestBehavior.opaque,
              child: SvgPicture.asset(
                AppIcons.moreVertical,
                color: const Color(0xff92929D),
              ),
            ),
          ],
          centerTitle: false,
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      offset: Offset(0, 4),
                      blurRadius: 16),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BMW 5 серии VII (G30/G31)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Модификация 530d xDrive 3.0d AT (249 л.с.) 4WD',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff92929D),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      charAdsContainer('Характеристики', context),
                      charAdsContainer('Объявления', context),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 219,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://autopragmat.ru/upload/iblock/f73/d72aoq71yladvp582mt51eehzu0l754u.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ракета 530 D 🚀',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '24 февраля 2022',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff92929D),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/8855632?v=4'),
                          radius: 22,
                        ),
                        const SizedBox(width: 8),
                        RichText(
                          text: const TextSpan(
                            text: 'Мухаммадамин\n',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff171725),
                            ),
                            children: [
                              TextSpan(
                                text: '12 января 2022 г.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff92929D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xffF1F1F5),
                    height: 16,
                  ),
                  const Text(
                    'Хотелось купить машину быстрее этой, если у вас есть на руке быстрее этой машины, качественнее и мощнее, я могу купить. Но все таки, за все время не пожалел владением этой машины, очень комфортно, За год и 4 месяца не вызвала нареканий в сервисе была только на ТО , расход топлива умеренный , хотя и пробег не большой у машины , брал жене а катался сам она только пару раз прокатилась , ей больше моя нравиться Санта ФЕ , так что машина была только для разъезда по городу и для отвоза ребёнка в школу и обратно...',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff171725),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Widget charAdsContainer(String text, BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 16),
        height: 38,
        width: MediaQuery.of(context).size.width * 0.41,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE2E2EA)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      );
}
