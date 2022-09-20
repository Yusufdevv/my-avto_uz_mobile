import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Топ марок автомобилей',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 18),
        ),
      ),
      const SizedBox(height: 8),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 100,
        child: BlocBuilder<TopBrandBloc, TopBrandState>(
          builder: (context, state) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CarBrandItem(
              carBrandEntity: state.brands[index],
              hasShadow: true,
            ),
            itemCount: state.brands.length,
          ),
        ),
      ),
    ],
  );
}
