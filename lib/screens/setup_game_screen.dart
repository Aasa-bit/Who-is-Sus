import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potato/l10n/app_localizations.dart';
import 'package:potato/models/game_player.dart';
import 'package:potato/widgets/game_button.dart';
import 'package:potato/widgets/settings_navigation_tile.dart';
import 'package:potato/widgets/stepper_tile.dart';

import '../data/game_words.dart';
import '../models/game_round.dart';
import '../utils/game_colors.dart';
import '../widgets/language_btn.dart';

class SetupGameScreen extends StatefulWidget {
  const SetupGameScreen({super.key});

  @override
  State<SetupGameScreen> createState() => _SetupGameScreenState();
}

class _SetupGameScreenState extends State<SetupGameScreen> {
  // int impostersCount = 1;
  int roundMinutes = 3;
  // int playersCount = 3;
  List<GamePlayer> players = [
    const GamePlayer(id: '1', name: 'player 1'),
    const GamePlayer(id: '2', name: 'player 2'),
    const GamePlayer(id: '3', name: 'player 3'),
  ];
  Future<void> openPlayersScreen() async {
    final result = await context.push<List<GamePlayer>>(
      '/players',
      extra: players,
    );

    if (!mounted || result == null) return;

    setState(() {
      players = result;

      // if (impostersCount >= players.length) {
      //   impostersCount = (players.length + 1) ~/ 2 - 1;
      // }
    });
  }

  // void changeImpostersCount(int change) {
  //   final nextValue = impostersCount + change;

  //   if (nextValue < 1 || nextValue >= (players.length + 1) ~/ 2) {
  //     return;
  //   }

  //   setState(() {
  //     impostersCount = nextValue;
  //   });
  // }

  void changeRoundMinutes(int change) {
    final nextValue = roundMinutes + change;

    if (nextValue < 3 || nextValue > 10) return;

    setState(() {
      roundMinutes = nextValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: GameColors.background,
      appBar: AppBar(
        toolbarHeight: 70,
        // title: Text(
        //   l10n.setUpYourGame,
        //   style: GoogleFonts.lalezar(
        //     fontSize: 24,
        //     fontWeight: FontWeight.w500,
        //     color: GameColors.textPrimary,
        //     letterSpacing: 1.5,
        //   ),
        // ),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: LanguageButton(),
        ),

        actionsPadding: const EdgeInsets.symmetric(horizontal: 16.0),

        actions: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: GameColors.textPrimary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                color: GameColors.textPrimary,
                alignment: Alignment.center,
                icon: Icon(
                  Icons.question_mark_rounded,
                  size: 16,
                  color: Colors.white,
                ),
                onPressed: () => context.push('/how-to-play'),
              ),
            ),
          ),

          // IconButton(
          //   onPressed: () {
          //     context.pop();
          //   },
          //   iconSize: 24,
          //   style: ButtonStyle(
          //     backgroundColor: WidgetStateProperty.all(GameColors.textPrimary),
          //     shape: WidgetStateProperty.all(
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
          //     ),
          //   ),
          //   icon: const Icon(
          //     Icons.question_mark_rounded,
          //     color: GameColors.white,
          //   ),
          // ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),

            // Setup Cards
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            l10n.setUpYourGame,
                            style: GoogleFonts.lalezar(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: GameColors.textPrimary,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),

                          SettingsNavigationTile(
                            title: '${l10n.players} (${players.length})',
                            icon: Icons.group_rounded,
                            onTap: openPlayersScreen,
                          ),
                          const SizedBox(height: 16),

                          // StepperTile(
                          //   title: l10n.impostors,
                          //   icon: Icons.person_search_rounded,
                          //   value: impostersCount,
                          //   onMinus: () => changeImpostersCount(-1),
                          //   onPlus: () => changeImpostersCount(1),
                          // ),
                          // const SizedBox(height: 16),
                          SettingsNavigationTile(
                            title: l10n.categories,
                            icon: Icons.category,
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          StepperTile(
                            title: l10n.roundTime,
                            icon: Icons.timer_outlined,
                            value: roundMinutes,
                            onMinus: () => changeRoundMinutes(-1),
                            onPlus: () => changeRoundMinutes(1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 16),
                // // Spacer(),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child:
                // ),
                // const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        color: GameColors.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: GameButton(
              label: l10n.startGame,
              enabled: true,
              onPressed: () {
                final l10n = AppLocalizations.of(context)!;

                final round = GameRound.create(
                  players: players,
                  words: getGameWords(l10n),
                  roundMinutes: roundMinutes,
                );

                context.push('/get-roles', extra: round);
              },
            ),
          ),
        ),
      ),
    );
  }
}
