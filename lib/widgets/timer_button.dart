import 'package:flutter/material.dart';
import '../utils/game_colors.dart';

class TimerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isPaused;

  const TimerButton({
    super.key,
    required this.onPressed,
    required this.isPaused,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: GameColors.primary,
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: GameColors.primaryDark,
              offset: Offset(0, 8),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            isPaused ? Icons.play_arrow_rounded : Icons.pause,
            color: GameColors.textPrimary,
            size: 32,
          ),
        ),
      ),
    );
  }
}
