// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/app_language_cubit/change_language_cubit.dart';
import '../../../domain/app_language_cubit/language_state.dart';
import '../../../utils/helpers/helper_functions.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        final String currentLanguage =
            state is ChangeLanguageSuccess ? state.languageCode ?? 'en' : 'en';

        return Tooltip(
          message: 'Change Language',
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _showLanguageMenu(context, currentLanguage),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: dark ? AppColors.darkerGrey : AppColors.dark,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _getLanguageFlag(currentLanguage),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _getLanguageFlag(String languageCode) {
    switch (languageCode) {
      case 'en':
        return '🇬🇧';
      case 'ar':
        return '🇸🇦';
      default:
        return '🌐';
    }
  }

  Future<void> _showLanguageMenu(
    BuildContext context,
    String currentLanguage,
  ) async {
    final selectedLanguage = await showMenu<String>(
      context: context,
      position: _calculateMenuPosition(context),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: [
        _buildLanguageMenuItem(
          context,
          'en',
          'English',
          '🇬🇧',
          currentLanguage == 'en',
        ),
        _buildLanguageMenuItem(
          context,
          'ar',
          'العربية',
          '🇸🇦',
          currentLanguage == 'ar',
        ),
      ],
    );

    if (selectedLanguage != null && selectedLanguage != currentLanguage) {
      context.read<ChangeLanguageCubit>().changeLanguage(
        selectedLanguage == 'en' ? LanguageState.en : LanguageState.ar,
      );
    }
  }

  PopupMenuItem<String> _buildLanguageMenuItem(
    BuildContext context,
    String language,
    String text,
    String flag,
    bool isSelected,
  ) {
    return PopupMenuItem<String>(
      value: language,
      height: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.dark : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            if (isSelected) ...[
              const Spacer(),
              Icon(
                Icons.check,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }

  RelativeRect _calculateMenuPosition(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return RelativeRect.fromLTRB(
      offset.dx,
      offset.dy + renderBox.size.height,
      offset.dx + renderBox.size.width,
      offset.dy + renderBox.size.height + 100,
    );
  }
}
