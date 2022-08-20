import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/posting_ad/preview/domain/entity/preview_entity.dart';
import 'package:auto/features/posting_ad/preview/presentation/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreviewItem extends StatelessWidget {
  final PreviewEntity previewEntity;

  const PreviewItem({required this.previewEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
          children: [
            ImageViewer(images: previewEntity.images),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                previewEntity.carModel,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '${previewEntity.price} UZS',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  WButton(
                    onTap: () {},
                    color: blue,
                    borderRadius: 6,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      AppIcons.chevronDownWhite,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.calendar),
                      const SizedBox(width: 8,),
                      Text(previewEntity.date, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, color: suvaGray),),
                    ],
                  ),
                  const SizedBox(width: 12,),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.eye),
                      const SizedBox(width: 8,),
                      Text(previewEntity.seenItem, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, color: suvaGray),),
                      const SizedBox(width: 4,),
                      Text('( ${previewEntity.seenToday} сегодня )', style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, color: suvaGray),),

                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8  ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.id),
                  const SizedBox(width: 8,),
                  Text(previewEntity.id, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12, color: suvaGray),),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(16),child: Divider(color: Theme.of(context).dividerColor,),),
          ],
        ),
  );
}
