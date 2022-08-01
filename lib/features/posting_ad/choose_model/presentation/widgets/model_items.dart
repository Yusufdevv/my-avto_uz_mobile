import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/posting_ad/choose_model/domain/entity/model_item_entity.dart';
import 'package:auto/features/posting_ad/choose_model/presentation/blocs/model_selectro_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
class ModelItems extends StatelessWidget {
  final ModelItemEntity entity;
  final int id;
  final int selectedId;
  const ModelItems({required this.entity, required this.selectedId, required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: (){
          print('clicked');
          context.read<ModelSelectorBloc>().add(SelectedModelItemEvent(id: id));
        },
        child: Container(color: id == selectedId  ?   Theme.of(context).extension<ThemedColors>()!.snowToNightRider :  Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            children: [
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entity.title, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
                    if(id == selectedId)SvgPicture.asset(AppIcons.check, color: orange,height: 14,),
                  ],
                ),
              ),
               Divider(
                color: Theme.of(context).dividerColor,
              ),
            ],
          ),
        ),
      );
}
