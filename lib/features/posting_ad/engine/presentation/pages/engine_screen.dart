import 'package:auto/features/common/widgets/switcher_row.dart';
import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class EngineScreen extends StatefulWidget {
  final VoidCallback onTap;

  const EngineScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<EngineScreen> createState() => _EngineScreenState();
}

class _EngineScreenState extends State<EngineScreen> {
  int selectedIndex = 0;
  final List<String> titleList = ['Бензиновый', 'Дизельный'];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(onTap: widget.onTap, padding: const EdgeInsets.only(top: 16),child:             Column(
          children: [

            ListView.builder(
              itemBuilder: (context, index) => RadioItem(
                  onTap: (value) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  title: titleList[index],
                  groupValue: index,
                  value: selectedIndex),
              itemCount: 2,
              shrinkWrap: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                thickness: 1,
                color: Theme.of(context).dividerColor,
              ),
            ),
            const SizedBox(height: 13,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SwitcherRow(title: 'Газобаллонное оборудование'),
            ),
          ],
        ),)
      );
}
