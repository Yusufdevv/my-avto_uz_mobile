import 'dart:typed_data';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationBoxOfAdPreview extends StatelessWidget {
  final Uint8List? bodyBytes;
  final String districtName;
  final String regionName;

  const LocationBoxOfAdPreview(
      {required this.bodyBytes,
      required this.districtName,
      required this.regionName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Место осмотра',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18)),
            const SizedBox(height: 8),
            if (bodyBytes != null && bodyBytes!.isNotEmpty) ...{
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(color: warmerGrey, width: 1),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: MemoryImage(bodyBytes!),
                      fit: BoxFit.cover,
                    )),
                // child:Image.asset(AppIcons.currentLoc),
              ),
            },
            Row(
              children: [
                SvgPicture.asset(AppIcons.send2),
                const SizedBox(width: 8),
                Text(
                  '$regionName, $districtName',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                ),
              ],
            )
          ],
        ),
      );
}
