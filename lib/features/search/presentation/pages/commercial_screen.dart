import 'package:auto/features/search/presentation/widgets/commercial_item.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  const Scaffold(
        body:  CommercialItem(),
      );
}
