import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsAppBarTitle extends StatelessWidget {
  const AdsAppBarTitle({
    required this.fadeDuration,
    required this.crossFadeState,
    Key? key,
  }) : super(key: key);

  final Duration fadeDuration;
  final CrossFadeState crossFadeState;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: fadeDuration,
        child: crossFadeState == CrossFadeState.showFirst
            ? SizedBox(
                key: const Key('1'),
                width: double.infinity,
                child: Text(
                  LocaleKeys.ads.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : SizedBox(
                key: const Key('2'),
                height: 60,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (context.read<GetMakesBloc>().state.name.isNotEmpty)
                      Text(
                        '${context.read<GetMakesBloc>().state.name}  ${context.read<GetCarModelBloc>().state.name}',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 16),
                      )
                    else
                      Text(
                        LocaleKeys.choose_brand_model.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 16),
                      ),
                    if (context.read<GetMakesBloc>().state.name.isNotEmpty)
                      Text(
                        '${context.read<AnnouncementListBloc>().state.count} ${LocaleKeys.offers.tr()}',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: grey,
                            ),
                      )
                  ],
                ),
              ),
      );
}
