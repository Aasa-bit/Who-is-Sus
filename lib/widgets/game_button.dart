import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/game_colors.dart';

class GameButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool enabled;

  const GameButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = false,
  });

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final isPressed = widget.enabled && _pressed;

    return Opacity(
      opacity: widget.enabled ? 1 : 0.7,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.enabled ? widget.onPressed : null,
          onHighlightChanged: (value) {
            setState(() {
              _pressed = value;
            });
          },
          borderRadius: BorderRadius.circular(32),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 80),
            curve: Curves.easeOut,
            height: 65,

            transform: Matrix4.translationValues(0, isPressed ? 8 : 0, 0),

            decoration: BoxDecoration(
              color: GameColors.primary,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: GameColors.primaryDark,
                  offset: Offset(0, isPressed ? 0 : 8),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: GoogleFonts.lalezar(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: GameColors.textPrimary,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
