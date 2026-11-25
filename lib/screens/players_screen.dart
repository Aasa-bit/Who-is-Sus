import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../l10n/app_localizations.dart';
import '../models/game_player.dart';
import '../utils/game_colors.dart';
import '../widgets/game_button.dart';
import '../widgets/game_icon_button.dart';

class PlayersScreen extends StatefulWidget {
  final List<GamePlayer> initialPlayers;

  const PlayersScreen({super.key, required this.initialPlayers});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  late final List<GamePlayer> players;
  int nextId = 1;

  @override
  void initState() {
    super.initState();
    players = List<GamePlayer>.from(widget.initialPlayers);
  }

  String createPlayerId() {
    while (players.any((p) => p.id == 'player_$nextId')) {
      nextId++;
    }
    return 'player_${nextId++}';
  }

  // ---------------- PLAYER DIALOG ----------------

  Future<void> editPlayer({int? index}) async {
    final formKey = GlobalKey<FormState>();
    final existingPlayer = index == null ? null : players[index];

    final l10n = AppLocalizations.of(context)!;

    String draft = existingPlayer?.name ?? '';

    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        void save() {
          if (formKey.currentState!.validate()) {
            Navigator.of(dialogContext).pop(draft.trim());
          }
        }

        return Dialog(
          backgroundColor: GameColors.background,
          insetPadding: const EdgeInsets.symmetric(horizontal: 28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dialog icon
                  Container(
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: GameColors.white,
                      // border: Border.all(
                      //   width: 1.5,
                      //   color: GameColors.textPrimary,
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.07),
                          blurRadius: 8,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: existingPlayer == null
                        ? Lottie.asset(
                            "assets/json/add.json",
                            height: 46,
                            width: 46,
                          )
                        : Lottie.asset(
                            "assets/json/edit.json",
                            height: 46,
                            width: 46,
                          ),

                    // child: Icon(
                    //   existingPlayer == null
                    //       ? Icons.person_add_alt_1_rounded
                    //       : Icons.edit_rounded,
                    //   size: 30,
                    //   color: GameColors.white,
                    // ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    existingPlayer == null
                        ? l10n.dialogTitleAdd
                        : l10n.dialogTitleEdit,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lalezar(
                      fontSize: 17,
                      color: GameColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Name input
                  TextFormField(
                    initialValue: draft,
                    autofocus: true,
                    maxLength: 30,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) => draft = value,
                    onFieldSubmitted: (_) => save(),
                    style: GoogleFonts.lalezar(
                      fontSize: 20,
                      color: GameColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      labelText: l10n.playerNameLabel,
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: GameColors.primary,
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: GameColors.white,
                      labelStyle: GoogleFonts.lalezar(
                        color: GameColors.textPrimary,
                        fontSize: 17,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: GameColors.primary.withValues(alpha: 0.25),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: GameColors.primary,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: GameColors.impostor,
                        ),
                      ),
                    ),
                    validator: (value) {
                      final playerName = (value ?? '').trim();

                      if (playerName.isEmpty) {
                        return l10n.validationRequired;
                      }

                      final duplicate = players.any(
                        (player) =>
                            player.id != existingPlayer?.id &&
                            player.name.toLowerCase() ==
                                playerName.toLowerCase(),
                      );

                      if (duplicate) {
                        return l10n.validationDuplicate;
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Dialog actions
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            style: TextButton.styleFrom(
                              foregroundColor: GameColors.textPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(
                              l10n.cancelButton,
                              style: GoogleFonts.lalezar(fontSize: 18),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: GameButton(
                            label: l10n.saveButton,
                            onPressed: save,
                            enabled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (!mounted || name == null) return;

    setState(() {
      if (index == null) {
        players.add(GamePlayer(id: createPlayerId(), name: name));
      } else {
        players[index] = GamePlayer(id: existingPlayer!.id, name: name);
      }
    });
  }

  // ---------------- PLAYER CARD ----------------

  Widget buildPlayerCard(GamePlayer player, int index) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 86,
      decoration: BoxDecoration(
        color: GameColors.white,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(36),
        child: InkWell(
          borderRadius: BorderRadius.circular(36),
          onTap: () => editPlayer(index: index),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 12),
            child: Row(
              children: [
                // Player number
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: GameColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: GameColors.primary, width: 2.5),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: GoogleFonts.lalezar(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: GameColors.textPrimary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Player name
                Expanded(
                  child: Text(
                    player.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lalezar(
                      fontSize: 18,
                      color: GameColors.textPrimary,
                    ),
                  ),
                ),

                // Edit
                // Icon(
                //   Icons.edit_rounded,
                //   size: 18,
                //   color: GameColors.primary.withValues(alpha: 0.7),
                // ),
                const SizedBox(width: 8),

                // Delete
                IconButton(
                  tooltip: l10n.deletePlayerTooltip,
                  onPressed: () {
                    setState(() {
                      players.removeWhere((p) => p.id == player.id);
                    });
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: GameColors.impostor,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- BUILD ----------------

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: GameColors.background,

      appBar: AppBar(
        backgroundColor: GameColors.background,
        elevation: 0,
        // centerTitle: true,
        // title: Text(
        //   l10n.players,
        //   style: GoogleFonts.lalezar(
        //     color: GameColors.textPrimary,
        //     fontSize: 16,
        //   ),
        // ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          // child: Column(
          //   children: [
          //     // Header
          //     Container(
          //       // width: 200,
          //       // height: 220,
          //       // padding: const EdgeInsets.symmetric(vertical: 4),
          //       decoration: BoxDecoration(
          //         // color: GameColors.white,
          //         // borderRadius: BorderRadius.circular(28),
          //       ),
          child: Column(
            children: [
              // Icon(
              //   Icons.groups_rounded,
              //   size: 48,
              //   color: GameColors.primary,

              // ),
              Image.asset(
                "assets/images/player.png",
                width: 180,
                fit: BoxFit.fitHeight,
              ),
              Text(
                '${players.length} ${l10n.players}',
                style: GoogleFonts.lalezar(
                  fontSize: 28,
                  color: GameColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              // ],
              // ),
              // ),

              // const SizedBox(height: 20),

              // Player list
              Expanded(
                child: players.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_add_alt_1_rounded,
                              size: 64,
                              color: GameColors.primary.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              l10n.addPlayerList,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lalezar(
                                fontSize: 21,
                                color: GameColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: players.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final player = players[index];

                          return buildPlayerCard(player, index);
                        },
                      ),
              ),

              const SizedBox(height: 12),

              // Minimum players warning
              if (players.length < 3)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        size: 17,
                        color: GameColors.impostor,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          l10n.minPlayersWarning,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lalezar(
                            fontSize: 16,
                            color: GameColors.impostor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Bottom actions
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GameIconButton(
                      icon: Icons.person_add_alt_1_rounded,
                      onPressed: () => editPlayer(),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    flex: 3,
                    child: GameButton(
                      label: l10n.saveButton,
                      enabled: players.length >= 3,
                      onPressed: () {
                        context.pop<List<GamePlayer>>(
                          List<GamePlayer>.from(players),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
