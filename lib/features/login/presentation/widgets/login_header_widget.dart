import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String description;
  const LoginHeader({required this.title, required this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 48,),
      Text(title, style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(fontSize: 18),),
      const SizedBox(height: 4,),
      Text(description,   style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontSize: 13, fontWeight: FontWeight.w400),),
    ],
  );
}
