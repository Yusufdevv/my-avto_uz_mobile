import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reels/domain/entities/content_entity.dart';
import 'package:auto/features/reels/presentation/widgets/content_item.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final List<ContentEntity> contentList = [
    const ContentEntity(
      price: '299000000',
      isDiscount: true,
      discountPercent: '30',
      oldPrice: '100000000',
      url:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      carName: 'Tesla Model X',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSWtya4qj_mT32BTG_ojOvMBaVOd-nRcPcxNn-UoPs7FfXVjBhg9AJ4l15Z3PC5aK8wsk&usqp=CAU',
      companyName: 'Premier Motors',
    ),
    const ContentEntity(
      price: '299000000',
      url:
          'https://player.vimeo.com/external/530192531.sd.mp4?s=3ad6c3e8a8cc6aa80f681a77f4ea41d3cc61d205&profile_id=165&oauth2_token_id=57447761',
      carName: 'Tesla Model X',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSWtya4qj_mT32BTG_ojOvMBaVOd-nRcPcxNn-UoPs7FfXVjBhg9AJ4l15Z3PC5aK8wsk&usqp=CAU',
      companyName: 'Premier Motors',
    ),
    const ContentEntity(
      price: '299000000',
      isDiscount: true,
      discountPercent: '30',
      oldPrice: '500000000',
      url:
          'https://player.vimeo.com/external/527002066.sd.mp4?s=4d29cb426c6bfa3329069118d7929027a4ba1ca4&profile_id=165&oauth2_token_id=57447761',
      carName: 'Tesla Model X',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSWtya4qj_mT32BTG_ojOvMBaVOd-nRcPcxNn-UoPs7FfXVjBhg9AJ4l15Z3PC5aK8wsk&usqp=CAU',
      companyName: 'Premier Motors',
    ),
    const ContentEntity(
      price: '299000000',
      isDiscount: true,
      discountPercent: '30',
      oldPrice: '100000000',
      url:
          'https://player.vimeo.com/external/433938674.sd.mp4?s=71fbc7c7a37f1123d6884b060f0304cdcf8ac988&profile_id=164&oauth2_token_id=57447761',
      carName: 'Tesla Model X',
      profileImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSWtya4qj_mT32BTG_ojOvMBaVOd-nRcPcxNn-UoPs7FfXVjBhg9AJ4l15Z3PC5aK8wsk&usqp=CAU',
      companyName: 'Premier Motors',
    ),
  ];

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Swiper(
                  itemCount: contentList.length,
                  allowImplicitScrolling: true,
                  itemHeight: MediaQuery.of(context).size.height,
                  scrollDirection: Axis.vertical,
                  onIndexChanged: (index) {},
                  itemBuilder: (context, index) =>
                      ContentItem(contentEntity: contentList[index]),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  left: 16,
                  child: Row(
                    children: [
                      WScaleAnimation(
                        child: SvgPicture.asset(AppIcons.chevronLeftWhite),
                        onTap: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppIcons.whiteLogo),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
