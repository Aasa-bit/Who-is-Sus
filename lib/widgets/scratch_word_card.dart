import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potato/utils/game_colors.dart';
import 'package:scratcher/scratcher.dart';

class ScratchWordCard extends StatefulWidget {
  final String? label;
  final String secretWord;
  final double brushRadius;

  const ScratchWordCard({
    super.key,
    this.label,
    required this.secretWord,
    this.brushRadius = 26,
  });

  @override
  State<ScratchWordCard> createState() => _ScratchWordCardState();
}

class _ScratchWordCardState extends State<ScratchWordCard> {
  final GlobalKey<ScratcherState> _scratchKey = GlobalKey<ScratcherState>();
  bool _isRevealed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: GameColors.primaryDark, width: 2.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: SizedBox(
          height: 64,
          child: Scratcher(
            key: _scratchKey,
            brushSize: widget.brushRadius * 1.2,
            threshold: 65,
            color: GameColors.primary,
            onThreshold: () {
              if (!_isRevealed) {
                setState(() => _isRevealed = true);
                _scratchKey.currentState?.reveal(
                  duration: const Duration(milliseconds: 250),
                );
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.label != null && widget.label!.isNotEmpty) ...[
                      Text(
                        widget.label!,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: GameColors.textPrimary.withAlpha(170),
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                    Text(
                      widget.secretWord,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lalezar(
                        fontSize: 28,
                        color: GameColors.primary,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
