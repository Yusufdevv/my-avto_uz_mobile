import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_bottom_sheet.dart';
import 'package:flutter/material.dart';

Future<Region> showRegionsBottomSheet(
        BuildContext context, List<Region> list) async =>
    await showModalBottomSheet<Region>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (c) => WBottomSheet(
        children: [
          Column(
            children: List.generate(
              list.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.pop(context, list[index]);
                }, behavior: HitTestBehavior.opaque,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: border))),
                  child: Row(
                    children: [
                      Text(
                        list[index].title,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).then((value) => value ?? const Region());
