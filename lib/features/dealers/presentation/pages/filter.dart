import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [Expanded(child: Text('Filter')), Text('clear')],
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 50),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Dealers'),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(),
                        ),
                        Container(),
                        Container(),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('data'),
                    const SizedBox(
                      height: 68,
                    ),
                    const Text('data'),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('data'),
                ),
              ),
            ],
          ),
        ),
      );
}
