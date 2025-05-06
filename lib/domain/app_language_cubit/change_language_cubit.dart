import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/app_language_cubit/language_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());
  late SharedPreferences prefs;

  Future<void> initialize() async {
    // prefs = await SharedPreferences.getInstance();
    // final savedLanguage = prefs.getString('language');
    // if (savedLanguage == 'en') {
    //   emit(ChangeLanguageSuccess(languageCode: 'en'));
    // } else if (savedLanguage == 'ar') {
    //   emit(ChangeLanguageSuccess(languageCode: 'ar'));
    // } else {
    //   emit(ChangeLanguageSuccess(languageCode: 'en'));
    // }
    prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language');
    final language = savedLanguage ;
    emit(ChangeLanguageSuccess(languageCode: language));
  }

  void changeLanguage(LanguageState languageState) async {
    print('Changing language to: $languageState');
    if (!prefs.containsKey('language')) {
      await initialize();
    }
    switch (languageState) {
      case LanguageState.initial:
        initialize();
        break;
      case LanguageState.en:
        prefs.setString('language', 'en');
        emit(ChangeLanguageSuccess(languageCode: 'en'));
        break;
      case LanguageState.ar:
        prefs.setString('language', 'ar');
        emit(ChangeLanguageSuccess(languageCode: 'ar'));
        break;
    }
  }
}
