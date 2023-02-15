part of 'choose_make_anime_bloc.dart';

class ChooseMakeAnimeState extends Equatable {
  final Animation<double> reversScaleAnimation;
  final Animation<double> scaleAnimation;
  final AnimationController animationController;

  final bool isAnimating;
  final bool isCollapsed;
  const ChooseMakeAnimeState({
    required this.isAnimating,
    required this.isCollapsed,
    required this.animationController,
    required this.reversScaleAnimation,
    required this.scaleAnimation,
  });
  ChooseMakeAnimeState copyWith({
    bool? isAnimating,
    bool? isCollapsed,
  }) =>
      ChooseMakeAnimeState(
          reversScaleAnimation: reversScaleAnimation,
          scaleAnimation: scaleAnimation,
          animationController: animationController,
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
