import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/app_theme_cubit/apptheme_cubit.dart';
import '../../../domain/app_theme_cubit/theme_state.dart';
import '../../../utils/constants/app_colors.dart';

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeTheme();
  }

  Future<void> _initializeTheme() async {
    await context.read<AppthemeCubit>().init();
    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const SizedBox(
        width: 60,
        height: 30,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    final themeCubit = context.watch<AppthemeCubit>();
    final isDark = themeCubit.state is DarkAppTheme;

    return Tooltip(
      message: isDark ? 'Switch to light theme' : 'Switch to dark theme',
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap:
            () => themeCubit.changeTheme(
              isDark ? ThemeState.light : ThemeState.dark,
            ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutBack,
          width: 64,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors:
                  isDark
                      ? [AppColors.darkerGrey, AppColors.dark]
                      : [AppColors.secondary.withOpacity(0.5), AppColors.secondary.withOpacity(0.1)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutBack,
                left: isDark ? 34 : 4,
                top: 4,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? Colors.blueGrey[300] : Colors.amber[600],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        isDark
                            ? const Icon(
                              Icons.nightlight_round,
                              key: ValueKey('moon'),
                              size: 16,
                              color: Colors.black54,
                            )
                            : Icon(
                              Icons.wb_sunny,
                              key: ValueKey('sun'),
                              size: 16,
                              color: Colors.orange[800],
                            ),
                  ),
                ),
              ),
              // Stars for dark mode
              if (isDark) ...[
                Positioned(left: 10, top: 10, child: _buildStar(0.8)),
                Positioned(left: 20, top: 6, child: _buildStar(0.6)),
                Positioned(left: 15, top: 15, child: _buildStar(0.4)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStar(double size) {
    return Opacity(
      opacity: 0.8,
      child: Icon(
        Icons.star,
        size: 8 * size,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }
}
