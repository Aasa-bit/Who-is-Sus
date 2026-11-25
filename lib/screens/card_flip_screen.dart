import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potato/utils/game_colors.dart';
import 'package:go_router/go_router.dart';

import '../widgets/game_button.dart';
import '../l10n/app_localizations.dart';
import '../models/game_player.dart';
import '../models/game_round.dart';

class CardFlipScreen extends StatefulWidget {
  final GameRound round;

  /// Navigate to discussion here, using your existing GoRouter route.
  final VoidCallback onStartTalking;

  const CardFlipScreen({
    super.key,
    required this.round,
    required this.onStartTalking,
  });

  @override
  State<CardFlipScreen> createState() => _CardFlipScreenState();
}

class _CardFlipScreenState extends State<CardFlipScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _flip;
  int _playerIndex = 0;
  bool _revealed = false;
  bool _leaving = false;

  GamePlayer get _player => widget.round.players[_playerIndex];
  bool get _lastPlayer => _playerIndex == widget.round.players.length - 1;
  bool get _ready => _revealed && _flip.isCompleted && !_leaving;

  @override
  void initState() {
    super.initState();
    _flip = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void didUpdateWidget(covariant CardFlipScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.round, widget.round)) {
      _flip.reset();
      _playerIndex = 0;
      _revealed = false;
      _leaving = false;
    }
  }

  @override
  void dispose() {
    _flip.dispose();
    super.dispose();
  }

  void _reveal() {
    if (_revealed || _flip.isAnimating || _leaving) return;
    setState(() => _revealed = true);
    _flip.forward();
  }

  void _next() {
    if (!_ready) return;
    if (_lastPlayer) {
      setState(() => _leaving = true);
      widget.onStartTalking();
      return;
    }
    // Reset instantly: do not animate the previous secret back into view.
    setState(() {
      _flip.reset();
      _revealed = false;
      _playerIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: GameColors.background,
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
            // Icons.close_rounded,
            Icons.highlight_remove_rounded,
            size: 36,
            color: GameColors.textPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: max(0.0, constraints.maxHeight - 40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        _player.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lalezar(
                          fontSize: 32,
                          color: GameColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: _buildCard(l10n),
                  ),
                  Column(
                    children: [
                      Text(
                        !_revealed
                            ? l10n.flipToRevealSecretWord
                            : l10n.passPhoneToNextPlayer,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: GameColors.textSecondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 36),
                      AnimatedBuilder(
                        animation: _flip,
                        builder: (context, child) => SizedBox(
                          width: double.infinity,
                          child: GameButton(
                            label: _lastPlayer
                                ? l10n.discussion
                                : l10n.nextPlayer,
                            onPressed: _next,
                            enabled: _ready,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(AppLocalizations l10n) {
    return SizedBox(
      width: 250,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: -0.07,
            child: Container(
              width: 230,
              height: 300,
              decoration: BoxDecoration(
                color: GameColors.primary,
                borderRadius: BorderRadius.circular(36),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
            ),
          ),
          Transform.rotate(
            angle: 0.15,
            child: Container(
              width: 230,
              height: 300,
              decoration: BoxDecoration(
                color: GameColors.primary,
                borderRadius: BorderRadius.circular(36),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _reveal,
            child: AnimatedBuilder(
              animation: _flip,
              builder: (context, child) {
                final angle = Curves.easeInOut.transform(_flip.value) * pi;
                final showSecret = angle >= pi / 2;
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(showSecret ? pi : 0),
                    child: Container(
                      width: 230,
                      height: 300,
                      padding: EdgeInsets.all(showSecret ? 12 : 18),
                      decoration: BoxDecoration(
                        color: showSecret
                            ? GameColors.white
                            : GameColors.primary,
                        borderRadius: BorderRadius.circular(36),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: showSecret
                          ? _secretContent(l10n)
                          : _backContent(l10n),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _backContent(AppLocalizations l10n) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        _player.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: GoogleFonts.lalezar(fontSize: 28, color: GameColors.white),
      ),
      SizedBox(height: 2),

      Image.asset('assets/images/card-back.png', width: 110, height: 110),
      SizedBox(height: 2),
      Text(
        l10n.tapToFlip,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(color: GameColors.textPrimary, fontSize: 12),
      ),
    ],
  );
  Widget _secretContent(AppLocalizations l10n) {
    final impostor = widget.round.isImpostor(_player);
    final word = widget.round.secret;
    return Container(
      margin: EdgeInsets.all(!impostor ? 2 : 0),
      decoration: BoxDecoration(
        color: impostor ? GameColors.impostor : GameColors.primary,
        borderRadius: BorderRadius.circular(28),
      ),
      child: SingleChildScrollView(
        // أضفنا SingleChildScrollView لمنع أي تجاوز محتمل
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 24,
                  left: 24,
                  child: !impostor
                      ? Text(
                          word.word,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lalezar(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            color: GameColors.textPrimary,
                          ),
                        )
                      : const SizedBox(height: 76),
                ),
                Center(
                  child: impostor
                      ? Container(
                          margin: const EdgeInsets.only(top: 110),
                          child: Image.asset(
                            'assets/images/Impostor Face.png',
                            width: 140,
                          ),
                        )
                      : Image.asset(
                          'assets/images/card-bg.png',
                          height: 276,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_outlined, size: 56),
                        ),
                ),
                if (word.imageAsset != null)
                  Positioned(
                    top: impostor ? 18 : 76,
                    left: impostor ? null : 20,
                    child: impostor
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                l10n.youAreThe,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  wordSpacing: 4,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              Text(
                                l10n.imposter,
                                style: GoogleFonts.lalezar(
                                  fontSize: 28,
                                  height: 0.9,
                                  letterSpacing: 1.8,
                                ),
                              ),
                            ],
                          )
                        : Image.asset(
                            word.imageAsset!,
                            height: 140,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_outlined, size: 56),
                          ),
                  )
                else
                  const Positioned(
                    child: Icon(
                      Icons.lock_outline,
                      size: 56,
                      color: Colors.black54,
                    ),
                  ),
              ],
            ),
            if (impostor && word.hint.trim().isNotEmpty)
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 44),
                    Text(
                      l10n.hintLabel(word.hint),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: GameColors.textPrimary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
