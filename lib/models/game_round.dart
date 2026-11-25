import 'dart:math';

import 'package:potato/models/game_player.dart';

import 'game_word.dart';

class GameRound {
  final List<GamePlayer> players;
  final Set<String> impostorIds;
  final RoundWord secret;
  final int roundMinutes;

  GameRound._({
    required List<GamePlayer> players,
    required Set<String> impostorIds,
    required this.secret,
    required this.roundMinutes,
  }) : players = List.unmodifiable(players),
       impostorIds = Set.unmodifiable(impostorIds);

  factory GameRound.create({
    required List<GamePlayer> players,
    required List<RoundWord> words,
    required int roundMinutes,
    Random? random,
  }) {
    if (players.length < 3) {
      throw ArgumentError('At least three players are required.');
    }
    if (players.any((p) => p.id.trim().isEmpty || p.name.trim().isEmpty) ||
        players.map((p) => p.id).toSet().length != players.length) {
      throw ArgumentError('Players need unique non-empty IDs and names.');
    }
    if (words.isEmpty || words.any((w) => w.word.trim().isEmpty)) {
      throw ArgumentError('Provide at least one non-empty word.');
    }
    final rng = random ?? Random();
    final shuffled = List<GamePlayer>.of(players)..shuffle(rng);
    return GameRound._(
      players: players,
      impostorIds: {shuffled.first.id},
      secret: words[rng.nextInt(words.length)],
      roundMinutes: roundMinutes,
    );
  }

  bool isImpostor(GamePlayer player) => impostorIds.contains(player.id);
}
