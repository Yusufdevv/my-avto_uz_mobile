import 'package:auto/assets/constants/images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StickyAdderCar extends StatelessWidget {
  final String name;
  final String carSalary;
  final String carImage;
  const StickyAdderCar({
    required this.name,
    required this.carSalary,
    required this.carImage,
    Key? key,
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
                          height: 44,
                          width: 44,
                        )
                      : CachedNetworkImage(
                          imageUrl: carImage,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset(
                            AppImages.placeHolder,
                            fit: BoxFit.fill,
                            height: 44,
                            width: 44,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carSalary,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
