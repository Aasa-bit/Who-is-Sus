import 'package:flutter/material.dart';
import '../utils/game_colors.dart';

class GameIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;
  final double size;
  final Color? iconColor;

  const GameIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.enabled = true,
    this.size = 64,
    this.iconColor,
  });

  @override
  State<GameIconButton> createState() => _GameIconButtonState();
}

class _GameIconButtonState extends State<GameIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final isPressed = widget.enabled && _pressed;

    return Opacity(
      opacity: widget.enabled ? 1 : 0.7,
      child: SizedBox(
        width: widget.size,
        height: widget.size * 0.9,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.enabled ? widget.onPressed : null,
            onHighlightChanged: (value) {
              setState(() {
                _pressed = value;
              });
            },
            borderRadius: BorderRadius.circular(36),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 80),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(0, isPressed ? 8 : 0, 0),
              decoration: BoxDecoration(
                color: GameColors.primary,
                borderRadius: BorderRadius.circular(36),
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
                child: Icon(
                  widget.icon,
                  size:
                      widget.size *
                      0.45, // جعل حجم الأيقونة متناسباً مع حجم المربع
                  color: widget.iconColor ?? GameColors.textPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
