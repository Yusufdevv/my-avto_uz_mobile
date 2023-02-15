import 'package:flutter/material.dart'; 

class CarModelText extends StatelessWidget {
  final String text;
  const CarModelText({required this.text, super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
}
