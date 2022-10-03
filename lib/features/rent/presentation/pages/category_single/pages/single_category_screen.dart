import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_list_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/rent_list_bloc/rent_list_bloc.dart';
import 'package:auto/features/rent/presentation/pages/category_single/widgets/category_single_item.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/pages/cars_single_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class SingleCategoryScreen extends StatefulWidget {
  final RentMainEntity rentMainEntity;

  const SingleCategoryScreen({required this.rentMainEntity, Key? key})
      : super(key: key);

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  late TextEditingController searchController;
  late RentListBloc resultBloc;

  @override
  void initState() {
    resultBloc = RentListBloc(RentListUseCase())
      ..add(RentListEvent.getResults(isRefresh: false));
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: resultBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                WScaleAnimation(
                    child: SvgPicture.asset(AppIcons.chevronLeft),
                    onTap: () => Navigator.pop(context)),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.rentMainEntity.name,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: WTextField(
                onChanged: (value) {},
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                borderRadius: 12,
                hasSearch: true,
                hintText: 'Поиск',
              ),
            ),
          ),
          body: BlocBuilder<RentListBloc, RentListState>(
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status.isSubmissionSuccess) {
                return Paginator(
                    hasMoreToFetch: state.count > state.list.length,
                    paginatorStatus: FormzStatus.submissionSuccess,
                    errorWidget: const SizedBox(),
                    fetchMoreFunction: () {
                      context
                          .read<RentListBloc>()
                          .add(RentListEvent.getMoreResults());
                    },
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) => CategorySingleItem(
                          rentCarEntity:
                              widget.rentMainEntity.rentList[index].rentCar,
                          onTap: () => Navigator.of(context).push(fade(
                              page: CarsSingleScreen(
                                  rentListEntity:
                                      widget.rentMainEntity.rentList[index]))),
                        ),
                    itemCount: widget.rentMainEntity.rentList.length);
              } else if (state.status.isSubmissionFailure) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      );
}
