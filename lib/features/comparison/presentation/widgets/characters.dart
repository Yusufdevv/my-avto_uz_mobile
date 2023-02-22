import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersList extends StatefulWidget {
  final String letter;
  final Color color;
  final ScrollController controller;
  const CharactersList({
    required this.letter,
    required this.color,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<CharactersList> createState() => _AzListState();
}

class _AzListState extends State<CharactersList> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<GetMakesBloc, GetMakesState>(
        builder: (context, state) => GestureDetector(
          onTap: () {
            // widget.controller.jumpTo(146);
            context
                .read<GetMakesBloc>()
                .add(GetMakesBlocEvent.getIndex(widget.letter));
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            color: widget.color,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.letter,
              style: widget.letter == state.selectChar
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: greyText)
                  : Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: warmerGrey),
            ),
          ),
        ),
      );
}
