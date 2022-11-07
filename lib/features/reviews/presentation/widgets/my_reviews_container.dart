import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/pages/single_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyReviewsContainer extends StatelessWidget {
  const MyReviewsContainer(
      {required this.statusColor,
      required this.statusIconPath,
      required this.statusTitle,
      this.isBlocked = false,
      super.key});

  final bool isBlocked;
  final Color statusColor;
  final String statusIconPath;
  final String statusTitle;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SingleReviewScreen(),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, 4),
                blurRadius: 16,
              ),
            ],
          ),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: isBlocked ? 0.3 : 1,
                    child: Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn.motor1.com/images/mgl/lA08g/s1/bmw-x7.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      avatar: SvgPicture.asset(
                        statusIconPath,
                        color: Colors.white,
                      ),
                      backgroundColor: statusColor,
                      label: Text(
                        statusTitle,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'BMW X7 40i 3.0 AT (340 л.с.) 4WD',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff92929D),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    label: const Text(
                      '3.6',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    avatar: SvgPicture.asset(AppIcons.star),
                  ),
                ],
              ),
              const Text(
                'Лучший автомобиль за свою цену',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (isBlocked)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      backgroundColor: Colors.white,
                      label: const Text(
                        'Причины блокировки',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC8534D),
                        ),
                      ),
                      avatar: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffC8534D),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppIcons.alertTriangle,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const Text(
                      'Несодержательный отзыв',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff171725),
                      ),
                    ),
                  ],
                )
              else
                Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  deleteEditContainer('Удалить', context),
                  deleteEditContainer('Редактировать', context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '24 февраля 2022',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff92929D),
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: SvgPicture.asset(
                      AppIcons.comment,
                      color: const Color(0xffB5B5BE),
                    ),
                    label: const Text(
                      '0',
                      style: TextStyle(color: Color(0xff696974)),
                    ),
                  ),
                  const Divider(),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: SvgPicture.asset(
                      AppIcons.eye,
                      color: const Color(0xffB5B5BE),
                    ),
                    label: const Text(
                      '0',
                      style: TextStyle(color: Color(0xff696974)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget deleteEditContainer(String text, BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 16),
        height: 38,
        width: MediaQuery.of(context).size.width * 0.447,
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
