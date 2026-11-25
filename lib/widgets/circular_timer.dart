import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/game_colors.dart';

class CircularTimer extends StatelessWidget {
  final int remainingSeconds;
  final int totalSeconds;

  const CircularTimer({
    required this.remainingSeconds,
    required this.totalSeconds,
    super.key,
  });

  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final progress = totalSeconds <= 0
        ? 0.0
        : (remainingSeconds / totalSeconds).clamp(0.0, 1.0);

    return SizedBox(
      width: double.infinity,
      // height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: GameColors.secondary,
              boxShadow: [
                BoxShadow(
                  color: GameColors.secondary.withAlpha(70),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),

          Container(
            width: 214,
            height: 214,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: GameColors.secondary,
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     GameColors.secondaryLight,
              //     GameColors.secondary,
              //     // GameColors.secondaryDark,
              //   ],
              // ),
            ),
          ),

          Container(
            width: 166,
            height: 166,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: GameColors.background,
              border: Border.all(color: GameColors.secondary, width: 3),
            ),
          ),

          // ProgressIndicator
          SizedBox(
            width: 190,
            height: 190,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 24,
              strokeCap: StrokeCap.round,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(
                GameColors.secondaryLight,
              ),
            ),
          ),
          // Time
          Text(
            formattedTime,
            style: GoogleFonts.lalezar(
              fontSize: 48,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w400,
              color: GameColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
