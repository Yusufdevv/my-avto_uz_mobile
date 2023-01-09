import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/log_out_bottomsheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySearchesPage extends StatefulWidget {
  const MySearchesPage({super.key});

  @override
  State<MySearchesPage> createState() => _MySearchesPageState();
}

// const EmptyItemBody(title: 'Нет уведомлении', subtitle: 'Ваши сохранённые поиски будут отображаться в данном разделе.',
// image: AppIcons.notification);

class _MySearchesPageState extends State<MySearchesPage> {
  bool isToggled = false;
  bool isDeleted = false;
  List<int> deletedList = [];
  List<int> list = [1, 3, 5, 6, 9];
  List<String> listMarks = ['Alfa Romeo', 'BMW', 'BYD', 'Mers', 'Tesla'];
  @override
  Widget build(BuildContext context) {
    print(deletedList);
    print(list);
    return CustomScreen(
      child: Scaffold(
        appBar: WAppBar(
          textWithButton: 'Мои поиски',
          extraActions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isToggled = !isToggled;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: isToggled
                    ? Text(
                        'Отменить',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: red, height: 1.3),
                      )
                    : SvgPicture.asset(AppIcons.delete, color: grey),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (isToggled) {
                if (deletedList.contains(list[index])) {
                  setState(() {
                    deletedList.remove(list[index]);
                  });
                } else {
                  setState(() {
                    deletedList.add(list[index]);
                  });
                }
              }
            },
            child: Container(
              key: ValueKey<int>(list[index]),
              margin: EdgeInsets.only(
                left: SizeConfig.h(16),
                right: SizeConfig.h(16),
                top: index == 0 ? SizeConfig.v(20) : 0,
                bottom: SizeConfig.v(12),
              ),
              padding: EdgeInsets.only(
                  left: SizeConfig.h(16),
                  right: SizeConfig.h(12),
                  top: SizeConfig.v(16),
                  bottom: SizeConfig.v(16)),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(SizeConfig.h(12)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 8),
                        blurRadius: 19,
                        color: profileContainers.withOpacity(0.07))
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    height: SizeConfig.v(38),
                    width: SizeConfig.h(38),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.h(50)),
                      child: CachedNetworkImage(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png'),
                    ),
                  ),
                  SizedBox(width: SizeConfig.h(6)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listMarks[index],
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: dark)),
                        SizedBox(height: SizeConfig.v(2)),
                        Text('147 GTA • Rome Edt 597',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: greyText)),
                      ],
                    ),
                  ),
                  if (isToggled)
                    SvgPicture.asset(deletedList.contains(list[index])
                        ? AppIcons.circleChecked
                        : AppIcons.circleEmpty)
                  else
                    SvgPicture.asset(AppIcons.chevronRight1)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: isToggled
            ? WButton(
                text: 'Удалить',
                color: deletedList.isNotEmpty ? orange : grey,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.h(16), vertical: SizeConfig.v(16)),
                onTap: () {
                  deletedList.isNotEmpty
                      ? showModalBottomSheet(
                          context: context,
                          builder: (context) => LogoOutBottomsheet(
                            title: 'Вы действительно хотите удалить?',
                            subTitle: 'Удаление возврату не поддлежит',
                            betweenHeight: 36,
                            onTap: () {
                              isDeleted = !isDeleted;
                              list.removeWhere((e) => deletedList.contains(e));

                              deletedList.clear();
                              setState(() {});
                              Navigator.pop(context);
                            },
                          ),
                        )
                      : context.read<ShowPopUpBloc>().add(ShowPopUp(
                          isSucces: false,
                          message: "O'chirish uchun avval tanlang"));
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
