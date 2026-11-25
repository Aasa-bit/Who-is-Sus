import 'package:go_router/go_router.dart';
import 'package:potato/screens/card_flip_screen.dart';
import 'package:potato/screens/players_screen.dart';
import 'package:potato/screens/voting_screen.dart';
import '../models/game_player.dart';
import '../models/game_round.dart';
import '../screens/talking_screen.dart';
import '../screens/how_to_play_screen.dart';

import '../screens/setup_game_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SetupGameScreen()),
    GoRoute(
      path: '/how-to-play',
      builder: (context, state) {
        return const HowToPlayScreen();
      },
    ),
    GoRoute(
      path: '/set-up-game',
      builder: (context, state) => const SetupGameScreen(),
    ),
    GoRoute(
      path: '/players',
      builder: (context, state) {
        return PlayersScreen(initialPlayers: state.extra as List<GamePlayer>);
      },
    ),
    GoRoute(
      path: '/get-roles',
      builder: (context, state) {
        final round = state.extra as GameRound;

        return CardFlipScreen(
          round: round,
          onStartTalking: () {
            context.go('/talking', extra: round);
          },
        );
      },
    ),
    GoRoute(
      path: '/talking',
      builder: (context, state) {
        final round = state.extra as GameRound;
        return TalkingScreen(round: round);
      },
    ),
    GoRoute(
      path: '/voting',
      builder: (context, state) {
        final round = state.extra as GameRound;
        return VotingScreen(players: round.players, round: round);
      },
    ),
  ],
);
