part of 'change_language_cubit.dart';

sealed class ChangeLanguageState {}

final class ChangeLanguageInitial extends ChangeLanguageState {}

final class ChangeLanguageSuccess extends ChangeLanguageState {
  final String? languageCode;
  ChangeLanguageSuccess({this.languageCode});
}


