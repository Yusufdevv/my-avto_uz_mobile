import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          title: 'Отзывы',
        ),
        body: Column(),
      );
}
