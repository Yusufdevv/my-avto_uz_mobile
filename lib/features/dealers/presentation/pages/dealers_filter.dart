import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealersFilter extends StatefulWidget {
  const DealersFilter({Key? key}) : super(key: key);

  @override
  State<DealersFilter> createState() => _DealersFilterState();
}

class _DealersFilterState extends State<DealersFilter> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: WAppBar(
          title: 'Фильтр',
          extraActions: [Text('Очистить')],
        ),
      );
}
