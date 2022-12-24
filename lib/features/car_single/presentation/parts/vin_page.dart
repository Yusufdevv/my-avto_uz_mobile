import 'package:auto/features/car_single/presentation/widgets/vin_page_item.dart';
import 'package:auto/features/car_single/presentation/widgets/vin_title_item.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';

class VinPage extends StatelessWidget {
  const VinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          title: 'Отчёт о проверке по VIN',
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VinTitleItem(
                title: "Проверка по VIN",
              ),
              const VinPageItem(
                description: 'Дата обновления',
                data: '11 Ноября 2022',
              ),
              const SizedBox(
                height: 10,
              ),
              const VinTitleItem(
                title: "Данные из ПТС",
              ),
              const VinPageItem(
                description: 'Марка и модель',
                data: 'KIA K5',
              ),
              const VinPageItem(
                description: 'Цвет',
                data: 'Черный',
              ),
              const VinPageItem(
                description: 'Год выпуска',
                data: '2020 г.',
              ),
              const VinPageItem(
                description: 'Объем двигателя',
                data: '2,5 Л',
              ),
              const VinPageItem(
                description: 'Мощность двигателя',
                data: '193 л.с.',
              ),
              const SizedBox(
                height: 10,
              ),
              const VinTitleItem(
                title: "Владельцы",
              ),
              const VinPageItem(
                description: 'Тип владельца',
                data: 'Физическое лицо',
              ),
              const VinPageItem(
                description: 'Период',
                data: '19 Октября 2021 - Сейчас',
              ),
              const SizedBox(
                height: 10,
              ),
              const VinTitleItem(
                title: "Нахождение в залоге",
              ),
              Text(
                'Автомобиль не находился в залоге',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 20,
              ),
              const VinTitleItem(
                title: "Ограничения",
              ),
              Text(
                'Ограничения на регистрационные и другие действия не обнаружены',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 10,
              ),
              const VinTitleItem(
                title: "Розыск",
              ),
              Text(
                'Сведения о нахождении в розыске не обнаружены',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      );
}
