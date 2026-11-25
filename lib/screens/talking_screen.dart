import 'dart:async' as async;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:potato/l10n/app_localizations.dart';
import 'package:potato/utils/game_colors.dart';
import 'package:potato/widgets/game_button.dart';
import 'package:potato/widgets/timer_button.dart';
import 'package:potato/widgets/circular_timer.dart';

import '../models/game_player.dart';
import '../models/game_round.dart';

class TalkingScreen extends StatefulWidget {
  final GameRound round;
  const TalkingScreen({required this.round, super.key});

  @override
  State<TalkingScreen> createState() => _TalkingScreenState();
}

class _TalkingScreenState extends State<TalkingScreen> {
  late int _remainingSeconds;
  bool _isPaused = false;

  async.Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (!mounted) return;
  //     showStartDialog();
  //   });
  // }
  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.round.roundMinutes * 60;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showStartDialog();
    });
  }

  void showStartDialog() {
    final l10n = AppLocalizations.of(context)!;

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withAlpha(102),
      pageBuilder: (context, animation, secondaryAnimation) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 230,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                    color: GameColors.background,
                    borderRadius: BorderRadius.circular(32.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(64),
                        offset: const Offset(0, 14),
                        blurRadius: 28,
                        spreadRadius: -2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.discussionInstructions,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: GameColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 120,
                        height: 48,
                        child: GameButton(
                          label: l10n.gotIt,
                          onPressed: () {
                            context.pop();
                            _startTimer();
                          },
                          enabled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  } // void showStartDialog() {
  //   final l10n = AppLocalizations.of(context)!;

  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     // barrierColor: Colors.black.withAlpha(400),
  //     builder: (context) {
  //       return AlertDialog(
  //         insetPadding: const EdgeInsets.symmetric(
  //           horizontal: 24,
  //           vertical: 24,
  //         ),

  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(28.0),
  //         ),
  //         backgroundColor: GameColors.background,
  //         contentPadding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
  //         content: Text(
  //           l10n.discussionInstructions,
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.poppins(
  //             fontSize: 16,
  //             fontWeight: FontWeight.w500,
  //             color: GameColors.textPrimary,
  //           ),
  //         ),
  //         actionsAlignment: MainAxisAlignment.center,
  //         actionsPadding: const EdgeInsets.only(bottom: 24.0),
  //         actions: [
  //           SizedBox(
  //             width: 120,
  //             child: GameButton(
  //               label: l10n.gotIt,
  //               onPressed: () {
  //                 context.pop();
  //                 _startTimer();
  //               },
  //               enabled: true,
  //             ),
  //             // child: ElevatedButton(
  //             //   onPressed: () {
  //             //     context.pop();
  //             //     _startTimer();
  //             //   },
  //             //   style: ElevatedButton.styleFrom(
  //             //     backgroundColor: const Color(
  //             //       0xFFFFD56B,
  //             //     ), // لون الزر الأصفر (استبدله بـ GameColors المناسب لديك)
  //             //     foregroundColor: const Color(
  //             //       0xFF4A3B32,
  //             //     ), // لون النص داخل الزر
  //             //     elevation: 2, // إضافة ظل خفيف للزر لتشابه التصميم البارز
  //             //     shape: RoundedRectangleBorder(
  //             //       borderRadius: BorderRadius.circular(20.0),
  //             //     ),
  //             //     padding: const EdgeInsets.symmetric(vertical: 12),
  //             //   ),
  //             //   child: Text(
  //             //     l10n.gotIt,
  //             //     style: const TextStyle(
  //             //       fontSize: 16,
  //             //       fontWeight: FontWeight.bold,
  //             //     ),
  //             //   ),
  //             // ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // void showStartDialog() {
  //   final l10n = AppLocalizations.of(context)!;

  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return AlertDialog(
  //         actionsAlignment: MainAxisAlignment.center,
  //         // title: const Text(""),
  //         backgroundColor: GameColors.background,
  //         content: Text(
  //           // "Each person takes turns saying exactly one word related to the secret word.",
  //           l10n.discussionInstructions,
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               context.pop();
  //               _startTimer();
  //             },
  //             child: Text(l10n.gotIt),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _startTimer() {
    _timer?.cancel();

    _timer = async.Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_isPaused) return;

      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        // context.go('/voting', extra: widget.round.players);
        context.go('/voting', extra: widget.round);
      }
    });
  }

  void _togglePause() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _vote() {
    List<GamePlayer> players = widget.round.players;
    // _isPaused=true;
    _timer?.cancel();

    context.go('/voting', extra: widget.round);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: GameColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.highlight_remove_rounded,
            size: 32,
            color: GameColors.textPrimary,
          ),
          onPressed: () {
            _timer?.cancel();
            context.pop();
            // Navigator.of(context).maybePop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //   l10n.roundTimerLabel,
              //   textAlign: TextAlign.center,
              //   style: GoogleFonts.lalezar(
              //     fontSize: 24,
              //     // fontWeight: FontWeight.bold,
              //     color: GameColors.textPrimary,
              //   ),
              // ),

              // const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/json/talking.json',
                      width: 140,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          height: 80,
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.talking,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lalezar(
                        fontSize: 24,
                        letterSpacing: 3.5,
                        fontWeight: FontWeight.w500,
                        color: GameColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 48),
                    CircularTimer(
                      remainingSeconds: _remainingSeconds,
                      totalSeconds: widget.round.roundMinutes * 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(24, 12, 24, 24),
        child: Row(
          children: [
            const SizedBox(width: 12),

            Expanded(
              flex: 2,
              child: GameButton(
                label: l10n.vote,
                onPressed: _vote,
                enabled: true,
              ),
            ),
            const SizedBox(width: 24),

            TimerButton(isPaused: _isPaused, onPressed: _togglePause),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
