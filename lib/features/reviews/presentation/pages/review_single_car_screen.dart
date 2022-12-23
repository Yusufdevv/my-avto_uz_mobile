import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reviews/presentation/parts/car_show_rating_field.dart';
import 'package:auto/features/reviews/presentation/parts/navigate_comments_button.dart';
import 'package:auto/features/reviews/presentation/parts/review_single_car_actions.dart';
import 'package:auto/features/reviews/presentation/parts/single_car_information_item.dart';
import 'package:auto/features/reviews/presentation/widgets/review_wrap_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewSingleCarScreen extends StatefulWidget {
  const ReviewSingleCarScreen(
      {required this.hasMoreVert,
      required this.images,
      required this.titleCarInfo,
      required this.subtitleCarInfo,
      required this.avatarPicture,
      required this.reviewName,
      required this.publishDate,
      required this.owner,
      required this.lastOnline,
      required this.shortDescription,
      required this.fullDescription,
      required this.commentsCount,
      required this.viewsCount,
      required this.overallRating,
      required this.pluses,
      required this.minuses,
      required this.shareFunction,
      this.moreVertFunction,
      this.appearanceRating = 0,
      this.comfortRating = 0,
      this.securityRating = 0,
      this.drivingRating = 0,
      this.reliabilityRating = 0,
      super.key});
  final bool hasMoreVert;
  final List<String> images;
  final String titleCarInfo;
  final String subtitleCarInfo;
  final String avatarPicture;
  final String reviewName;
  final String publishDate;
  final String owner;
  final String lastOnline;
  final String shortDescription;
  final String fullDescription;
  final int commentsCount;
  final int viewsCount;
  final double overallRating;
  final int appearanceRating;
  final int comfortRating;
  final int securityRating;
  final int drivingRating;
  final int reliabilityRating;
  final List<String> pluses;
  final List<String> minuses;
  final VoidCallback shareFunction;
  final dynamic moreVertFunction;

  @override
  State<ReviewSingleCarScreen> createState() => _ReviewSingleCarScreenState();
}

class _ReviewSingleCarScreenState extends State<ReviewSingleCarScreen> {
  int currentState = 1;

  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: borderCircular,
        appBar: WAppBar(
          centerTitle: false,
          hasBackButton: true,
          extraActions: [
            WScaleAnimation(
              onTap: widget.shareFunction,
              child: SvgPicture.asset(
                AppIcons.share,
                color: grey,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 8),
            if (widget.hasMoreVert)
              WScaleAnimation(
                onTap: widget.moreVertFunction ?? () {},
                child: SvgPicture.asset(
                  AppIcons.moreVertical,
                  color: grey,
                  fit: BoxFit.cover,
                  width: 24,
                  height: 32,
                ),
              )
            else
              const SizedBox(),
            SizedBox(width: widget.hasMoreVert ? 16 : 0),
          ],
          title: 'Отзыв',
          titleStyle:
              Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 16),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleCarInformationItem(
                informationTitle: widget.titleCarInfo,
                informationSubtitle: widget.subtitleCarInfo,
              ),
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.images.length,
                    itemBuilder: (context, index, realIndex) => SizedBox(
                      height: 219,
                      width: double.maxFinite,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Image.asset(
                          AppImages.carPlaceHolder,
                          fit: BoxFit.cover,
                        ),
                        imageUrl: widget.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentState = index + 1;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 17,
                    child: AnimatedCrossFade(
                      firstChild: Text('$currentState/24',
                          style: Theme.of(context).textTheme.bodyText1),
                      secondChild: Text('${currentState + 1}/24',
                          style: Theme.of(context).textTheme.bodyText1),
                      crossFadeState: CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: widget.reviewName,
                          style: Theme.of(context).textTheme.headline1),
                      TextSpan(
                          text: widget.publishDate,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 13)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(widget.avatarPicture),
                    ),
                    const SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: '${widget.owner}\n',
                              style: Theme.of(context).textTheme.subtitle1),
                          TextSpan(
                            text: widget.lastOnline,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: dividerColor,
                endIndent: 16,
                indent: 16,
                thickness: 1,
                height: 37,
              ),
              AnimatedCrossFade(
                firstChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.shortDescription,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 13),
                          ),
                          WidgetSpan(
                            child: WScaleAnimation(
                              child: Text(
                                'Больше',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: orange,
                                      fontSize: 13,
                                    ),
                              ),
                              onTap: () {
                                setState(() {
                                  crossFadeState = CrossFadeState.showSecond;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                secondChild: WScaleAnimation(
                  child: Text(
                    widget.fullDescription,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: orange,
                          fontSize: 13,
                        ),
                  ),
                  onTap: () {
                    setState(() {
                      crossFadeState = CrossFadeState.showFirst;
                    });
                  },
                ),
                firstCurve: Curves.linear,
                secondCurve: Curves.linear,
                crossFadeState: crossFadeState,
                duration: const Duration(milliseconds: 3000),
              ),
              const Divider(
                color: dividerColor,
                endIndent: 16,
                indent: 16,
                thickness: 1,
                height: 37,
              ),
              ReviewSingleCarActions(
                commentsCount: widget.commentsCount,
                viewsCount: widget.viewsCount,
              ),
              const SizedBox(height: 16),
              const Divider(color: dividerColor, thickness: 1),
              const SizedBox(height: 25),
              CarShowRatingField(
                overallRating: widget.overallRating,
                appearanceRating: widget.appearanceRating,
                comfortRating: widget.comfortRating,
                securityRating: widget.securityRating,
                drivingRating: widget.drivingRating,
                reliabilityRating: widget.reliabilityRating,
              ),
              const SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: border, width: 1),
                    borderRadius: BorderRadius.circular(12),
                    color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReviewWrapBuilder(
                      title: 'Плюсы',
                      titleIcon: AppIcons.plus,
                      iconColor: green,
                      labels: widget.pluses,
                    ),
                    const SizedBox(height: 20),
                    ReviewWrapBuilder(
                      title: 'Минусы',
                      titleIcon: AppIcons.minus,
                      iconColor: red,
                      labels: widget.minuses,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              NavigateCommentsButton(commentsCount: widget.commentsCount),
            ],
          ),
        ),
      );
}
