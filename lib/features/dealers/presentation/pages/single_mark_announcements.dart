import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';

class SingleMarkAnnouncements extends StatefulWidget {
  final String carMark;
  const SingleMarkAnnouncements({Key? key, required this.carMark}) : super(key: key);

  @override
  State<SingleMarkAnnouncements> createState() => _SingleMarkAnnouncementsState();
}

class _SingleMarkAnnouncementsState extends State<SingleMarkAnnouncements> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          extraActions: [
            Text(widget.carMark,
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
          child: Column(children: []),
        ),
      );
}
