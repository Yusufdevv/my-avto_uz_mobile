import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/presentation/widgets/automobile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleMarkAnnouncements extends StatelessWidget {
  const SingleMarkAnnouncements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: WAppBar(
        extraActions: [
          Text('Genesis',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
          const Spacer(
            flex: 120,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [CarsCard(), CarsCard(), CarsCard()],
        ),
      ));
}
