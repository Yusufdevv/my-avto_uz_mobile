import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/presentation/widgets/automobile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleMarkAnnouncements extends StatelessWidget {
  const SingleMarkAnnouncements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: WAppBar(
        child: Row(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Genesis',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(width: 250),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [CarsCard(), CarsCard(), CarsCard()],
        ),
      ));
}
