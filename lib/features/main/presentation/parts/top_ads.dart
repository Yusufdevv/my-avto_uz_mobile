import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopAds extends StatelessWidget {
  const TopAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              LocaleKeys.best_offers.tr(),
              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<TopAdBloc, TopAdState>(
            builder: (context, state) => SizedBox(
              height: 276,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AdsItem(
                  adsEntity: state.topAds[index],
                ),
                itemCount: 2,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      );
}
