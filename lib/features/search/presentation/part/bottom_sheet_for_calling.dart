import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<dynamic> bottomSheetForCalling(BuildContext context, String phone) =>
    Platform.isAndroid
        ? showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) => SizedBox(
              height: 150,
              child: Column(
                children: [
                  WScaleAnimation(
                    
                    child: Container(
                      height: 64,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(13)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.greyPhoneCall,
                              width: 28, height: 28),
                          const SizedBox(width: 12),
                          Text(
                            phone,
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: dodgerBlue,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      launchUrlString('tel: $phone');
                    },
                  ),
                  WScaleAnimation(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(13)),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        'Отменить',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: dodgerBlue,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              actions: [
                WScaleAnimation(
                  child: Container(
                    color: white,
                    height: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.greyPhoneCall,
                            width: 28, height: 28),
                        const SizedBox(width: 12),
                        Text(
                          phone,
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: dodgerBlue,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    launchUrlString('tel: $phone');
                  },
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDefaultAction: true,
                child: Text(
                  'Отменить',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: dodgerBlue,
                      ),
                ),
              ),
            ),
          );
