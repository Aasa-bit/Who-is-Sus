import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potato/l10n/app_localizations.dart';
import 'package:potato/utils/game_colors.dart';
import 'package:potato/widgets/how_to_play_card.dart';
import 'package:provider/provider.dart';

import '../providers/locale_provider.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    String ln = context.read<LocaleProvider>().locale.languageCode;
    return Scaffold(
      backgroundColor: GameColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.highlight_remove_rounded,
            size: 32,
            color: GameColors.textPrimary,
          ),
        ),
      ),
      body: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
            stops: [0.0, 0.03],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 240,
                    height: 210,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 24),
                          width: 140,
                          height: 140,
                          decoration: const BoxDecoration(
                            color: GameColors.impostor,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.question_mark_rounded,
                              size: 84,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ln == 'ar'
                            ? Positioned(
                                top: -6,
                                child: Text(
                                  l10n.howToPlay,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lalezar(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800,
                                    color: GameColors.textDark,
                                  ),
                                ),
                              )
                            : ArcText(
                                radius: 76,
                                startAngle: 0,
                                stretchAngle: 2.5,
                                startAngleAlignment: StartAngleAlignment.center,
                                placement: Placement.outside,
                                direction: Direction.clockwise,
                                text: l10n.howToPlay,
                                textStyle: GoogleFonts.lalezar(
                                  fontSize: 28,

                                  fontWeight: FontWeight.w800,
                                  color: GameColors.textDark,
                                ),
                              ),
                      ],
                    ),
                  ),
                  // 1. GET YOUR ROLE
                  HowToPlayCard(
                    number: '1',
                    title: l10n.getYourRole,
                    description: l10n.getYourRoleDescription,

                    //                       '''Receive your card and secretly discover your role.
                    // Everyone gets the same word — except the Impostor.''',
                  ),

                  // 2. GIVE A CLUE
                  HowToPlayCard(
                    number: '2',
                    title: l10n.giveAClue,
                    description: l10n.giveAClueDescription,
                    //                       '''Take turns saying one word that describes the hidden word.
                    // Impostor: Blend in and try to discover the word.''',
                  ),

                  // 3. VOTE
                  HowToPlayCard(
                    number: '3',
                    title: l10n.vote,
                    description: l10n.votingInstructions,
                    //                       '''When it's time to vote, choose the player you suspect is the Impostor.
                    // The player with the most votes is caught.''',
                  ),

                  // // 4. FINAL GUESS
                  // HowToPlayCard(
                  //   number: '4',
                  //   title: l10n.finalGuess,
                  //   description: l10n.impostorLastChance,
                  // ),

                  // // 5. SURVIVE OR ELIMINATE
                  // HowToPlayCard(
                  //   number: '5',
                  //   title: l10n.surviveOrEliminate,
                  //   description: l10n.correctGuessRule,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
