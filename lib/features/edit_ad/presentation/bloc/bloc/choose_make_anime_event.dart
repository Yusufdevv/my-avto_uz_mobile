part of 'choose_make_anime_bloc.dart';

abstract class ChooseMakeAnimeEvent {}

class ChooseMakeAnimeChangeParamsEvent extends ChooseMakeAnimeEvent {
  final bool? isCollapsed;
  final bool? isAnimating;
  final String where;
  ChooseMakeAnimeChangeParamsEvent({
    required this.where,
    this.isAnimating,
    this.isCollapsed,
  });
}
