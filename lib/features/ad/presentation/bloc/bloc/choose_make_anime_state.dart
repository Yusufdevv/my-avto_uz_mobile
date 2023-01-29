part of 'choose_make_anime_bloc.dart';

class ChooseMakeAnimeState extends Equatable {
  final Animation<double> reversScaleAnimation;
  final Animation<double> scaleAnimation;
  final bool isAnimating;
  final bool isCollapsed;
  const ChooseMakeAnimeState(
      {required this.isAnimating,
      required this.isCollapsed,
      required this.reversScaleAnimation,
      required this.scaleAnimation});
  ChooseMakeAnimeState copyWith(
          {bool? isAnimating,
          bool? isCollapsed,
          Animation<double>? scaleAnimation,
          Animation<double>? reversScaleAnimation}) =>
      ChooseMakeAnimeState(
          reversScaleAnimation:
              reversScaleAnimation ?? this.reversScaleAnimation,
          scaleAnimation: scaleAnimation ?? this.scaleAnimation,
          isAnimating: isAnimating ?? this.isAnimating,
          isCollapsed: isCollapsed ?? this.isCollapsed);
  @override
  List<Object?> get props => [
        reversScaleAnimation,
        scaleAnimation,
        isAnimating,
        isCollapsed,
      ];
}
