import 'package:auto/assets/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StickyAdderCar extends StatelessWidget {
  final String name;
  final String carSalary;
  final String carImage;
  const StickyAdderCar({
    Key? key,
    required this.name,
    required this.carSalary,
    required this.carImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: (MediaQuery.of(context).size.width) / 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                width: 44,
                height: 44,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: carImage.isEmpty
                      ? SvgPicture.asset(
                          AppImages.placeHolder,
                          fit: BoxFit.fill,
                        )
                      : CachedNetworkImage(imageUrl: carImage),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carSalary,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
