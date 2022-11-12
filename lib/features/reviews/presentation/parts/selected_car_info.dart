import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reviews/presentation/widgets/review_tab_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedCarInfo extends StatefulWidget {
  const SelectedCarInfo(
      {required this.overallRating,
      required this.pluses,
      required this.minuses,
      required this.reviewCount,
      this.image = '',
      super.key});
  final String image;
  final double overallRating;
  final int reviewCount;
  final List<String> pluses;
  final List<String> minuses;

  @override
  State<SelectedCarInfo> createState() => _SelectedCarInfoState();
}

class _SelectedCarInfoState extends State<SelectedCarInfo>
    with SingleTickerProviderStateMixin {
  bool ratingState = false;
  bool plusState = false;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: border, width: 1),
          borderRadius: BorderRadius.circular(12),
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: border, width: 1),
              ),
              padding: const EdgeInsets.all(4),
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(
                    AppImages.carPlaceHolder,
                    fit: BoxFit.cover,
                  ),
                  imageUrl: widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ExpansionTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Общая оценка',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(AppIcons.star),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.overallRating}',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
              subtitle: Text(
                'По ${widget.reviewCount} отзывам',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),
              ),
              children: [const Text('Children')],
            ),
            const Divider(
                indent: 12, color: dividerColor, thickness: 1, height: 1),
            ExpansionTile(
              title: Row(
                children: [
                  Text(
                    'Плюсы и минусы',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(AppIcons.plusMinus)
                ],
              ),
              subtitle: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.pluses.length}',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: green,
                          ),
                    ),
                    TextSpan(
                      text: '/',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: dividerColor,
                          ),
                    ),
                    TextSpan(
                      text: '${widget.minuses.length}',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: red,
                          ),
                    ),
                  ],
                ),
              ),
              children: [
                ReviewTabBar(
                  tabController: tabController,
                  tabLabels: const ['Плюсы', 'Минусы'],
                  backgroundColor: border,
                  indicatorColor: orange,
                  selectedTextColor: white,
                  unSelectedColor: black,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.separated(
                        itemCount: 1,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => const ListTile(),
                      ),
                      ListView.separated(
                        itemCount: 1,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => const ListTile(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
