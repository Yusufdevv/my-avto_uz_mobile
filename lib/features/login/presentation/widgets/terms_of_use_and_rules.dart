import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/about_app/terms_of_use_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsOfUseAndRules extends StatelessWidget {
  const TermsOfUseAndRules({super.key});

  @override
  Widget build(BuildContext context) => StorageRepository.getString(
              'language') ==
          'uz'
      ? RichText(
          text: TextSpan(
          children: [
            TextSpan(
                text: "Ro'yxatdan o'tishni davom ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToGreySuit)),
            TextSpan(
                text: 'ettirish orqali men ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToGreySuit)),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: WScaleAnimation(
                  child: Text('foydalanish ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .mediumSlateBlueToDolphin,
                          fontSize: 11)),
                  onTap: () {
                    context
                        .read<ProfileBloc>()
                        .add(GetTermsOfUseEvent(slug: 'условия пользования'));

                    Navigator.push(context, fade(page: const TermsOfUsePage()));
                  },
                )),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: WScaleAnimation(
                  child: Text('shartlari ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .mediumSlateBlueToDolphin,
                          fontSize: 11)),
                  onTap: () {
                    context
                        .read<ProfileBloc>()
                        .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                    Navigator.push(context, fade(page: const TermsOfUsePage()));
                  },
                )),
            TextSpan(
                text: 'va ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToGreySuit)),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: WScaleAnimation(
                  child: Text(
                    'qoidalarini ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .mediumSlateBlueToDolphin,
                        fontSize: 11),
                  ),
                  onTap: () {
                    context
                        .read<ProfileBloc>()
                        .add(GetTermsOfUseEvent(slug: 'правила'));
                    Navigator.push(context, fade(page: const TermsOfUsePage()));
                  },
                )),
            TextSpan(
                text: 'qabul qilganimni ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToGreySuit)),
            TextSpan(
                text: 'tan olaman',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToGreySuit)),
          ],
        ))
      : RichText(
          text: TextSpan(
          children: [
            TextSpan(
                text: 'Продолжая регистрацию, я признаю что принимаю ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToGreySuit)),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: WScaleAnimation(
                  child: Text('условия ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .mediumSlateBlueToDolphin,
                          fontSize: 11)),
                  onTap: () {
                    context
                        .read<ProfileBloc>()
                        .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                    Navigator.push(context, fade(page: const TermsOfUsePage()));
                  },
                )),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: WScaleAnimation(
                  child: Text('использования ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .mediumSlateBlueToDolphin,
                          fontSize: 11)),
                  onTap: () {
                    context
                        .read<ProfileBloc>()
                        .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                    Navigator.push(context, fade(page: const TermsOfUsePage()));
                  },
                )),
            TextSpan(
                text: 'и ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToGreySuit)),
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: WScaleAnimation(
                  child: Text(
                    'правила ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .mediumSlateBlueToDolphin,
                        fontSize: 11),
                  ),
                  onTap: () {
                    context
                        .read<ProfileBloc>()
                        .add(GetTermsOfUseEvent(slug: 'правила'));
                    Navigator.push(context, fade(page: const TermsOfUsePage()));
                  },
                )),
          ],
        ));
}
