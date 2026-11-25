import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/game_colors.dart';

class HowToPlayCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const HowToPlayCard({
    required this.number,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Constants.width(context) * 0.9,
      decoration: BoxDecoration(
        color: GameColors.surface,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: GameColors.black.withAlpha(64),
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      width: double.infinity,
      // height:,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: GameColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: GameColors.primary, width: 4),
                  ),
                  child: Center(
                    child: Text(
                      number,
                      style: GoogleFonts.lalezar(
                        fontSize: 24,

                        fontWeight: FontWeight.w800,
                        color: GameColors.textDark,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        // textAlign: TextAlign.start,
                        style: GoogleFonts.lalezar(
                          fontSize: 24,

                          fontWeight: FontWeight.w600,
                          color: GameColors.textDark,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 4,
                        margin: const EdgeInsets.only(right: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: GameColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(99)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.lalezar(
                fontSize: 16,

                fontWeight: FontWeight.w400,
                color: GameColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
