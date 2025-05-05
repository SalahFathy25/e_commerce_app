// import 'package:bloc/bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'theme_state.dart';

// part 'apptheme_state.dart';

// class AppthemeCubit extends Cubit<AppThemeState> {
//   AppthemeCubit() : super(AppThemeInitial());
//   late SharedPreferences prefs;

//   changeTheme(ThemeState state) {
//     switch (state) {
//       case ThemeState.initial:
//         if (prefs.getString('theme') != null) {
//           if (prefs.getString('theme') == 'light') {
//             emit(LightAppTheme());
//           } else {
//             emit(DarkAppTheme());
//           }
//         }
//         break;
//       case ThemeState.light:
//         prefs.setString('theme', 'light');
//         emit(LightAppTheme());
//         break;
//       case ThemeState.dark:
//         prefs.setString('theme', 'dark');
//         emit(DarkAppTheme());
//         break;
//     }
//   }
// }


import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

part 'apptheme_state.dart';

class AppthemeCubit extends Cubit<AppThemeState> {
  AppthemeCubit() : super(AppThemeInitial());

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    changeTheme(ThemeState.initial);
  }

  void changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.initial:
        final theme = prefs.getString('theme');
        if (theme != null) {
          emit(theme == 'light' ? LightAppTheme() : DarkAppTheme());
        }
        break;
      case ThemeState.light:
        prefs.setString('theme', 'light');
        emit(LightAppTheme());
        break;
      case ThemeState.dark:
        prefs.setString('theme', 'dark');
        emit(DarkAppTheme());
        break;
    }
  }
}
