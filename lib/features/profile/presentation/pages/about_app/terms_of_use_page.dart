import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(textWithButton: LocaleKeys.rules_of_using.tr()),
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.status == FormzStatus.submissionSuccess) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    if (state.termsOfUseEntity.title != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          state.termsOfUseEntity.title!,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Html(
                        data: state.termsOfUseEntity.content,
                        style: {
                          'p strong': Style(
                              color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .darkToWhite,
                              fontSize: FontSize(14),
                              fontWeight: FontWeight.w700),
                          'p': Style(
                              padding: const EdgeInsets.only(bottom: 16),
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .darkToWhite,
                              fontSize: FontSize(14),
                              fontWeight: FontWeight.w500)
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text('Something went wrong'),
          );
        }),
      );
}
