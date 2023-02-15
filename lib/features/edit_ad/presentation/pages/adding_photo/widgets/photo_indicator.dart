import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class PhotoIndicator extends StatelessWidget {
  final bool isActive;
  final String numbers;

  const PhotoIndicator({required this.numbers, this.isActive = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          boxShadow: [
            if (isActive)
              BoxShadow(blurRadius: 20, color: purple.withOpacity(0.6))
            else
              const BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          children: [
            Text(
              numbers,
              style: isActive
                  ? Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16)
                  : Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 13, color: warmerGrey),
            ),
            const SizedBox(
              height: 2,
            ),
            if (isActive)
              Container(
                height: 2,
                width: 28,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(2)),
                    color: purple),
              )
            else
              const SizedBox()
          ],
        ),
      );
}
