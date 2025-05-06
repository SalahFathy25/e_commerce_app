import 'package:e_commerce_app/domain/app_language_cubit/change_language_cubit.dart';
import 'package:e_commerce_app/features/auth/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/route_manager.dart';

import 'domain/app_theme_cubit/apptheme_cubit.dart';
import 'localization/generated/l10n.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = ChangeLanguageCubit();
            cubit.initialize();
            return cubit;
          },
        ),
        BlocProvider(create: (context) => AppthemeCubit()..init()),
      ],
      child: BlocBuilder<AppthemeCubit, AppThemeState>(
        builder: (context, themeState) {
          final theme =
              (themeState is DarkAppTheme)
                  ? AppTheme.darkTheme
                  : AppTheme.lightTheme;
          return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
            builder: (context, langState) {
              final locale =
                  (langState is ChangeLanguageSuccess &&
                          langState.languageCode != null)
                      ? Locale(langState.languageCode!)
                      : const Locale('en');
              return GetMaterialApp(
                key: ValueKey(locale.languageCode),
                debugShowCheckedModeBanner: false,
                title: 'E-Commerce App',
                // themeMode: ThemeMode.system,
                theme: theme,
                // darkTheme: AppTheme.darkTheme,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,

                home: OnboardingScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
