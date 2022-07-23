import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealerList extends StatefulWidget {
  const DealerList({Key? key}) : super(key: key);

  @override
  State<DealerList> createState() => _DealerListState();
}

class _DealerListState extends State<DealerList> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.chevron_left,
            color: Color.fromRGBO(146, 146, 157, 1),
          ),
          title: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Mark, Model',
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(105, 105, 116, 1),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(244, 244, 244, 1)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 11),
                child: Icon(Icons.settings),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.all(16),
              child: CupertinoSlidingSegmentedControl<String>(
                  padding: const EdgeInsets.all(2),
                  thumbColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(118, 118, 128, 0.12),
                  children: const {'list': Text('List'), 'map': Text('Map')},
                  onValueChanged: (onValueChanged) {}),
            ),
          ),
        ),
        body: ListView(),
      );
}
