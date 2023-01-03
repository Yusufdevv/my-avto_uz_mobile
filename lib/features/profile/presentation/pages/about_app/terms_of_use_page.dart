import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({required this.profileBloc, super.key});
  final ProfileBloc profileBloc;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: profileBloc,
        child: Scaffold(
          appBar: const WAppBar(textWithButton: 'Правила пользования'),
          body:
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state.status == FormzStatus.submissionSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.v(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.h(16),
                        ),
                        child: Text(
                          state.termsOfUseEntity[0].title!,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      SizedBox(height: SizeConfig.v(16)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.h(10),
                        ),
                        child: Html(
                          data: state.termsOfUseEntity[0].content,
                          style: {
                            'p strong': Style(
                                color: const Color(0xFF171717),
                                fontSize: FontSize(14),
                                fontWeight: FontWeight.w900),
                            'p': Style(
                                padding:
                                    EdgeInsets.only(bottom: SizeConfig.v(16)),
                                color: const Color.fromARGB(255, 37, 37, 37),
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
        ),
      );
}
