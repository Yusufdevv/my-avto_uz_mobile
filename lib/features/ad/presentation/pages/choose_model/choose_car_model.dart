import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarModelScreen extends StatefulWidget {
  const ChooseCarModelScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCarModelScreen> createState() => _ChooseCarModelScreenState();
}

class _ChooseCarModelScreenState extends State<ChooseCarModelScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: BlocBuilder<PostingAdBloc, PostingAdState>(
              builder: (context, state) => CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      /// HEADER TEXT
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 16,
                          ),
                          child: Text(
                            LocaleKeys.choose_model.tr(),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),

                      /// SEARCH FIELD
                      SliverToBoxAdapter(
                        child: WTextField(
                          fillColor: white,
                          filled: true,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          onChanged: (value) => context
                              .read<PostingAdBloc>()
                              .add(PostingAdModelEvent(name: value)),
                          hasClearButton: true,
                          onClear: () {
                            searchController = TextEditingController();
                            context
                                .read<PostingAdBloc>()
                                .add(PostingAdModelEvent());
                          },
                          borderRadius: 12,
                          hasSearch: true,
                          focusColor: white,
                          borderColor: purple,
                          hintText: LocaleKeys.search.tr(),
                          height: 40,
                          controller: searchController,
                          textStyle: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),

                      /// SIZED BOX
                      SliverToBoxAdapter(
                        child: Transform.translate(
                          offset: const Offset(0, 1),
                          child: Container(
                            height: 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// POPULAR HEADER
                      SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToDark,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  LocaleKeys.popular.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: purple),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Theme.of(context).dividerColor,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// POPULAR TYPES
                      if (state.status == FormzStatus.submissionInProgress) ...{
                        const SliverToBoxAdapter(
                            child: Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: Center(child: CupertinoActivityIndicator()),
                        ))
                      } else ...{
                        if (state.models.isNotEmpty)
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                if (index == state.models.length) {
                                  if (state.nextModels != null) {
                                    log(':::::::::: NEXT MODELS IN PAGE:  ${state.nextModels}  ::::::::::');
                                    context
                                        .read<PostingAdBloc>()
                                        .add(PostingAdMoreModelsEvent());
                                    log('::::::::: AFTER CALL MORE MODEL EVENT:  ${state.nextModels}  ::::::::::');
                                    return Container(
                                      height: 90,
                                      color: Theme.of(context)
                                          .extension<ThemedColors>()!
                                          .whiteToDark,
                                      child: const CupertinoActivityIndicator(),
                                    );
                                  }
                                  return const SizedBox();
                                }
                                return Container(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .whiteToDark,
                                  child: ModelItems(
                                    hasBorder: index != state.models.length - 1,
                                    onTap: () => context
                                        .read<PostingAdBloc>()
                                        .add(PostingAdChooseEvent(
                                            model: state.models[index])),
                                    title: state.models[index].name,
                                    isSelected: (state.model?.id ?? -1) ==
                                        state.models[index].id,
                                    text: searchController.text,
                                  ),
                                );
                              },
                              childCount: state.models.length + 1,
                            ),
                          )
                        else
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(top: 100, bottom: 100),
                              child: NoDataWidget(),
                            ),
                          ),
                      },

                      /// JUST CONTAINER
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  )),
        ),
      );
}
