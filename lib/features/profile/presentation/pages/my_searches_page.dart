import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySearchesPage extends StatelessWidget {
  const MySearchesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          textWithButton: 'Мои поиски',
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
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
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png'),
                  ),
                ),
                SizedBox(width: SizeConfig.h(6)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alfa Romeo',
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
                // Text('21',
                //     style: Theme.of(context)
                //         .textTheme
                //         .headline6
                //         ?.copyWith(color: warmerGrey)),
                // SizedBox(width: SizeConfig.h(4)),
                SvgPicture.asset(AppIcons.chevronRight1)
              ],
            ),
          ),
        ),
      );
}
