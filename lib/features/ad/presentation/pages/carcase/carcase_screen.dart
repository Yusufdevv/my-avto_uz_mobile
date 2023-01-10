import 'package:auto/features/ad/presentation/pages/carcase/widget/carcase_item.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class CarcaseScreen extends StatelessWidget {
  const CarcaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: BaseWidget(
          hasButton: false,
          child: ListView.builder(
            itemBuilder: (context, index) => CarCaseItem(title: 'Седан'),
            itemCount: 1,
          )));
}
