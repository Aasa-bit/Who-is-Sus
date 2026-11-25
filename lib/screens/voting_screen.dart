import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:potato/l10n/app_localizations.dart';
import 'package:potato/models/game_round.dart';
import 'package:potato/utils/game_colors.dart';

import '../models/game_player.dart';
import '../widgets/game_button.dart';
import '../widgets/scratch_word_card.dart';

class VotingScreen extends StatefulWidget {
  final List<GamePlayer> players;
  final GameRound round;
  const VotingScreen({super.key, required this.players, required this.round});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  List<GamePlayer> get players => widget.players;
  final Map<int, int> votes = {}; // مفتاح: مؤشر المقترع، قيمة: مؤشر المتهم
  int currentPlayer = 0;
  int? selectedPlayer;
  bool revealed = false;

  bool _isFlipped = false; // هل قلبت البطاقة لإظهار المحتال؟
  bool _maskRemoved = false; // هل تمت إزالة القناع عن البريء؟
  bool _showStamp = false; // هل حان وقت نزول الختم من الأعلى؟
  bool _showWord = false;

  void submitVote() {
    final target = selectedPlayer;

    if (revealed ||
        target == null ||
        target == currentPlayer ||
        target < 0 ||
        target >= players.length) {
      return;
    }

    setState(() {
      votes[currentPlayer] = target;
      selectedPlayer = null;

      // عندما ينتهي آخر لاعب من التصويت، نكشف النتائج النهائية ونبدأ التسلسل
      if (currentPlayer == players.length - 1) {
        revealed = true;
        _startRevealAnimation();
      } else {
        currentPlayer++;
      }
    });
  }

  void _startRevealAnimation() async {
    final counts = List<int>.generate(
      players.length,
      (i) => votes.values.where((v) => v == i).length,
    );
    final largest = counts.isNotEmpty
        ? counts.reduce((a, b) => a > b ? a : b)
        : 0;
    final winners = List.generate(
      players.length,
      (i) => i,
    ).where((i) => counts[i] == largest && largest > 0).toList();

    if (winners.isEmpty) {
      winners.add(0);
    }
    final votedPlayer = players[winners.first];
    final realImposter = players.firstWhere(
      (p) => widget.round.isImpostor(p),
      orElse: () => players.first,
    );

    final isCaught = votedPlayer.id == realImposter.id;

    if (isCaught) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (!mounted) return;
      setState(() {
        _showStamp = true;
      });
      return;
    }

    await Future.delayed(const Duration(milliseconds: 3500));
    if (!mounted) return;
    setState(() {
      _maskRemoved = true;
    });

    await Future.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    setState(() {
      _isFlipped = true;
    });

    // الخطوة 3: نزول الختم بسرعة أكبر
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() {
      _showStamp = true;
    });
  }

  void restart() {
    setState(() {
      votes.clear();
      currentPlayer = 0;
      selectedPlayer = null;
      revealed = false;
      _isFlipped = false;
      _maskRemoved = false;
      _showStamp = false;
      _showWord = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(
            Icons.highlight_remove_rounded,
            size: 32,
            color: GameColors.textPrimary,
          ),
        ),
      ),
      backgroundColor: GameColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: revealed ? _results() : _votingBody(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(12, 12, 12, 24),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: GameButton(
                label: revealed
                    ? l10n.playAgain
                    : currentPlayer == players.length - 1
                    ? l10n.reveal
                    : l10n.nextPlayer,
                enabled: revealed || selectedPlayer != null,
                onPressed: revealed
                    ? () {
                        restart();
                        context.go('/');
                      }
                    : submitVote,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _votingBody() {
    final options = List.generate(
      players.length,
      (i) => i,
    ).where((i) => i != currentPlayer).toList();

    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          players[currentPlayer].name,
          style: GoogleFonts.lalezar(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: GameColors.primary,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 20),
        Lottie.asset('assets/json/doodle-black-19-magnifier-hover-pinch.json'),
        const SizedBox(height: 24),
        Text(
          l10n.whoIsTheImposter,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: GameColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 26),
        LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 14.0;
            final cardWidth = (constraints.maxWidth - spacing) / 2.25;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              alignment: WrapAlignment.center,
              children: [
                for (final i in options)
                  SizedBox(width: cardWidth, child: _choice(i)),
              ],
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _choice(int playerIndex) {
    final selected = selectedPlayer == playerIndex;
    return GestureDetector(
      onTap: () => setState(() => selectedPlayer = playerIndex),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(
            color: selected ? GameColors.primary : const Color(0xFFE6E4DB),
            width: selected ? 5 : 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          players[playerIndex].name,
          textAlign: TextAlign.center,
          style: GoogleFonts.kronaOne(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: GameColors.secondaryDark,
          ),
        ),
      ),
    );
  }

  Widget _results() {
    final counts = List<int>.generate(
      players.length,
      (i) => votes.values.where((v) => v == i).length,
    );

    final largest = counts.isNotEmpty
        ? counts.reduce((a, b) => a > b ? a : b)
        : 0;

    final winners = List.generate(
      players.length,
      (i) => i,
    ).where((i) => counts[i] == largest && largest > 0).toList();

    if (winners.isEmpty) {
      winners.add(0);
    }

    final votedPlayer = players[winners.first];

    final realImposter = players.firstWhere(
      (p) => widget.round.isImpostor(p),
      orElse: () => players.first,
    );

    final caughtImpostor = votedPlayer.id == realImposter.id;
    final showImposterSide = _isFlipped || caughtImpostor;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            caughtImpostor ? l10n.youCaughtTheImposter : l10n.imposterEscaped,
            textAlign: TextAlign.center,
            style: GoogleFonts.lalezar(
              color: GameColors.impostor,
              fontSize: 28,
              fontWeight: FontWeight.w600,
              letterSpacing: 4,
            ),
          ),
          SizedBox(height: 20),
          Text(
            caughtImpostor ? l10n.votedForImposter : l10n.votedForWrongPerson,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: GameColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Transform.rotate(
                    angle: -10 * (math.pi / 180),
                    alignment: Alignment.center,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: showImposterSide ? math.pi : 0,
                      ),
                      duration: const Duration(milliseconds: 550),
                      curve: Curves.easeInOutCubic,
                      builder: (context, angle, _) {
                        final isBackHalf = angle > (math.pi / 2);

                        final transform = Matrix4.identity()
                          ..setEntry(3, 2, 0.0012)
                          ..rotateY(angle);

                        return Transform(
                          transform: transform,
                          alignment: Alignment.center,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(top: 52),
                            width: 220,
                            height: 280,
                            decoration: BoxDecoration(
                              color: showImposterSide
                                  ? const Color.fromARGB(255, 255, 192, 188)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(48),
                              border: Border.all(
                                color: showImposterSide
                                    ? GameColors.white
                                    : GameColors.primary,
                                width: 12,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: isBackHalf
                                ? Transform(
                                    transform: Matrix4.identity()
                                      ..rotateY(math.pi),
                                    alignment: Alignment.center,
                                    child: _imposterCardContent(realImposter),
                                  )
                                : (caughtImpostor
                                      ? _imposterCardContent(realImposter)
                                      : _innocentCardContent(votedPlayer)),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                if (showImposterSide)
                  Positioned(
                    // duration: const Duration(milliseconds: 300),
                    // curve: Curves.bounceOut,
                    right: 40,
                    top: 36,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _showStamp ? 1.0 : 0.0,
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceOut,
                        scale: _showStamp ? 1 : 2.5,
                        child: Image.asset(
                          'assets/images/imposter.png',
                          width: 160,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // const SizedBox(height: 48),

          // const SizedBox(height: 8),
          // if (_showStamp)
          // Text(
          //   caughtImpostor ? l10n.votedForImposter : l10n.scratchToReveal,
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.poppins(
          //     color: GameColors.textPrimary,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1.5,
          //   ),
          // ),
          // ScratchWordCard(
          //   // label: l10n.revealWord,
          //   secretWord: widget.round.secret.word.toString(),
          // ),
        ],
      ),
    );
  }

  Widget _innocentCardContent(GamePlayer player) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Lottie.asset(
          'assets/json/Business_Man_Masking_Smiling_Face_v4.json',
          width: 180,
        ),
        const SizedBox(height: 16),
        Text(
          player.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: GameColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _imposterCardContent(GamePlayer imposter) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Lottie.asset(
          'assets/json/Business_Man_Masking_Smiling_Face_v2.json',
          width: 170,
          height: 170,
        ),
        const SizedBox(height: 12),
        Text(
          imposter.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: GameColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
