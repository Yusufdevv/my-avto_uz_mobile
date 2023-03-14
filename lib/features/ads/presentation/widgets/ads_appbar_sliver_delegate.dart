import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
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
                    Text(
                      '${context.read<AnnouncementListBloc>().state.make?.name ?? LocaleKeys.choose_brand_model.tr()}  ${context.read<AnnouncementListBloc>().state.modelName ?? ''}',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
      );
}
