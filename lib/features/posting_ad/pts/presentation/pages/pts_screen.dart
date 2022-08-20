import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_container.dart';
import 'package:auto/features/posting_ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/posting_ad/pts/presentation/blocs/date_picker_bloc.dart';
import 'package:auto/features/posting_ad/pts/presentation/widgets/pts_buttons.dart';
import 'package:auto/features/posting_ad/pts/presentation/widgets/show_cupertino_date_picker.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PtsScreen extends StatefulWidget {
  final VoidCallback onTap;

  const PtsScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<PtsScreen> createState() => _PtsScreenState();
}

class _PtsScreenState extends State<PtsScreen> {
  late DatePickerBloc bloc;

  String currentId = '';
  String ownerId = '';
  final List<String> documentList = [
    'Оригинал / Электронный ПТС',
    'Дубликат',
  ];

  final List<String> ownerList = [
    'Первый',
    'Второй',
    'Третий',
    'Четвёртый или более',
  ];

  @override
  void initState() {
    bloc = DatePickerBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocProvider.value(
          value: bloc,
          child: Scaffold(
            body: BaseWidget(
              onTap:  ownerId.isNotEmpty && currentId.isNotEmpty ? widget.onTap:  (){} ,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Тип документа',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: greyText),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                        documentList.length,
                        (index) => PtsButtons(
                          onTap: (id) => setState(() => currentId = id),
                          id: index.toString(),
                          isSelected: index.toString() == currentId,
                          text: documentList[index],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    Text(
                      'Какой вы владелец?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                        ownerList.length,
                        (index) => PtsButtons(
                          onTap: (id) => setState(() => ownerId = id),
                          id: index.toString(),
                          isSelected: index.toString() == ownerId,
                          text: ownerList[index],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    Text(
                      'Когда был куплен автомобиль?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    BlocBuilder<DatePickerBloc, DatePickerState>(
                      builder: (context, state) => WContainer(
                        onTap: () {
                          showCupertinoDatePicker(
                            context,
                            (date) => context.read<DatePickerBloc>().add(
                                  PickedDate(date: date.toString()),
                                ),
                          );
                        },
                        title:state.date.isNotEmpty? MyFunctions.getData(state.date):'Выберите дату',
                        trailingIcon: AppIcons.calendar,
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
