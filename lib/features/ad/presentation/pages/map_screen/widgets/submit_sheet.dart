import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/point_name_shimmer.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///

class PostingAdSubmitBox extends StatefulWidget {
  final String? pointName;
  final VoidCallback? onTab;
  const PostingAdSubmitBox({
    required this.pointName,
    required this.onTab,
    super.key,
  }) : super();

  @override
  State<PostingAdSubmitBox> createState() => _PostingAdSubmitBoxState();
}

class _PostingAdSubmitBoxState extends State<PostingAdSubmitBox> {
  Map<int, Region> checkStatus = <int, Region>{};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 162,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -8),
                blurRadius: 24,
                spreadRadius: 0,
                color: profileContainers.withOpacity(.05)),
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 24,
                spreadRadius: 0,
                color: profileContainers.withOpacity(.08))
          ],
          color: white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppIcons.foldedMap, color: greyText),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'г.Ташкент, Мирабадский район, ул.Туркистон, дом 12А',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            WButton(
              isDisabled: widget.onTab == null,
              onTap: widget.onTab ?? () {},
              color: orange,
              text: LocaleKeys.confirm.tr(),
            ),
          ],
        ),
      );
}
