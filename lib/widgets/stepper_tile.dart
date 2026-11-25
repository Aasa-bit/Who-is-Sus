import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/game_colors.dart';

class StepperTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;
  const StepperTile({
    required this.title,
    required this.icon,
    required this.value,
    required this.onMinus,
    required this.onPlus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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

          _CounterButton(icon: Icons.remove_rounded, onTap: onMinus),

          const SizedBox(width: 12),

          Text(
            '$value',
            style: GoogleFonts.lalezar(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: GameColors.textPrimary,
            ),
          ),

          const SizedBox(width: 14),

          _CounterButton(icon: Icons.add_rounded, onTap: onPlus),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CounterButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: GameColors.textPrimary,
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}
