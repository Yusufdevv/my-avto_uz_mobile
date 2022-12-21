part of 'suggestion_bloc.dart';


@Freezed()
 class SuggestionState with _$SuggestionState {
   factory SuggestionState({
     @Default(false) bool isLocaleSuggestion,
     @Default(false) bool isResultPage,
     @Default(FormzStatus.pure) FormzStatus status,
     @Default(SuggestionEntity()) SuggestionEntity suggestions,
     @Default([]) List<String> popularSuggestions,
     @Default([]) List<String> localeSuggestions,

 })=_SuggestionState;
 }


