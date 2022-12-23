import 'package:auto/features/comparison/presentation/widgets/added_car_widget.dart';
import 'package:flutter/material.dart';

class ListOfAddedCars extends StatefulWidget {
  final List list;
  const ListOfAddedCars({Key? key, required this.list}) : super(key: key);

  @override
  State<ListOfAddedCars> createState() => _ListOfAddedCarsState();
}

class _ListOfAddedCarsState extends State<ListOfAddedCars> {
  @override
  Widget build(BuildContext context) {
    print(widget.list.length);
    return SizedBox(
      width:
          ((MediaQuery.of(context).size.width - 28) / 2) * widget.list.length +
              20,
      child: ReorderableListView(
        padding: const EdgeInsets.only(left: 6),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final AddedCar item = widget.list.removeAt(oldIndex);
            widget.list.insert(newIndex, item);
          });
        },
        children: [
          ...List.generate(widget.list.length, (index) => widget.list[index]),
        ],
      ),
    );
  }
}
