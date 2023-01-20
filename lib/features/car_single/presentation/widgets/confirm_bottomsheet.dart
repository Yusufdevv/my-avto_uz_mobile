import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmBottomSheet extends StatefulWidget {
  const ConfirmBottomSheet(
      {required this.title,
      required this.subTitle,
      required this.betweenHeight,
      Key? key})
      : super(key: key);
  final int betweenHeight;
  final String title;
  final String subTitle;

  @override
  State<ConfirmBottomSheet> createState() => _ConfirmBottomSheetState();
}

class _ConfirmBottomSheetState extends State<ConfirmBottomSheet> {

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child:
                      SvgPicture.asset(AppIcons.close, height: 32, width: 32)),
            ),
            const SizedBox(height: 12),
            Text(widget.title,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(widget.subTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                textAlign: TextAlign.center),
            SizedBox(height: widget.betweenHeight.toDouble()),
            Row(
              children: [
                Expanded(
                  child: WButton(
                      color: solitude,
                      onTap: () {
                        Navigator.pop(
                          context,
                          false,
                        );
                      },
                      text: 'Нет',
                      textColor: greyText),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WButton(
                    color: tutu,
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    text: 'Да',
                    textColor: red,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}