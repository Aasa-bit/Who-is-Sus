import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potato/utils/game_colors.dart';

class SettingsNavigationTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsNavigationTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: GameColors.textPrimary),

            const SizedBox(width: 18),

            Expanded(
              child: Text(
                title,
                style: GoogleFonts.lalezar(
                  fontSize: 20,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w400,
                  color: GameColors.textPrimary,
                ),
              ),
            ),

            const SizedBox(width: 12),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: GameColors.textPrimary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
