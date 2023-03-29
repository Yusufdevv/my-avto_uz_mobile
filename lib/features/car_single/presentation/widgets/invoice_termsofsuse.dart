import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/about_app/terms_of_use_page.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceTermsOfUse extends StatelessWidget {
  const InvoiceTermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(children: [
          WidgetSpan(
            child: Text(
              LocaleKeys.invoice_terms1.tr(),
              style:  TextStyle(
                  color: Theme.of(context).extension<ThemedColors>()!.blackToWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 11),
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                context
                    .read<ProfileBloc>()
                    .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                Navigator.push(context, fade(page: const TermsOfUsePage()));
              },
              child: Text(
                LocaleKeys.invoice_terms2.tr(),
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              ),
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                context
                    .read<ProfileBloc>()
                    .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                Navigator.push(context, fade(page: const TermsOfUsePage()));
              },
              child: Text(
                LocaleKeys.invoice_terms3.tr(),
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              ),
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                context
                    .read<ProfileBloc>()
                    .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                Navigator.push(context, fade(page: const TermsOfUsePage()));
              },
              child: Text(
                LocaleKeys.invoice_terms4.tr(),
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              ),
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                context
                    .read<ProfileBloc>()
                    .add(GetTermsOfUseEvent(slug: 'условия пользования'));
                Navigator.push(context, fade(page: const TermsOfUsePage()));
              },
              child: Text(
                LocaleKeys.invoice_terms5.tr(),
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 11),
              ),
            ),
          ),
          WidgetSpan(
              child: Text(
            LocaleKeys.invoice_terms6.tr(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 11),
          )),
          WidgetSpan(
              child: Text(
            LocaleKeys.invoice_terms7.tr(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 11),
          )),
        ]),
      );
}
