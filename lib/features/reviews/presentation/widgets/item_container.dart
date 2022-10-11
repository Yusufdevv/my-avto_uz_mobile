import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/reviews/presentation/widgets/model_rating.dart';
import 'package:auto/features/reviews/presentation/widgets/comment_seen.dart';
import 'package:flutter/material.dart';

Widget itemContainer(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 16),
      height: 381,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: dark.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 7,
            //offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://carexpert.ru/img/foto600/kia/kiamg171.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            carModelandRating(),
            const SizedBox(height: 12),
            const Text(
              'Лучший автомобиль за свою цену',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ФИНАЛЬНАЯ ЦЕНА за НАЛИЧНЫЙ РАСЧЕТ 2 879 000 руб. Автомобиль в безупречном состоянии! Без дтп! По регистрациям, были перевесы Гос номеров, прос...',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xff171725),
              ),
            ),
            const SizedBox(height: 17),
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
                commentSeen(),
              ],
            ),
          ],
        ),
      ),
    );
