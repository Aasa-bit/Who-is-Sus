import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:potato/providers/locale_provider.dart';

import '../utils/game_colors.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    // final locale = context.watch<LocaleProvider>().locale;

    return SizedBox(
      child: IconButton(
        onPressed: () {
          context.read<LocaleProvider>().toggleLocale();
        },
        icon: const Icon(
          Icons.translate_rounded,
          size: 26,
          fontWeight: FontWeight.bold,
          color: GameColors.textPrimary,
        ),
      ),
    );
    // ElevatedButton(
    // onPressed: () {
    //   context.read<LocaleProvider>().toggleLocale();
    // },
    //   child: Text(locale.languageCode == 'en' ? 'العربية' : 'English'),
    // );
  }
}
