// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:potato/widgets/language_btn.dart';

// import '../l10n/app_localizations.dart';

// // import '../models/game_player.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     // final List<GamePlayer> players = [
//     //   GamePlayer(id: "1", name: 'Saleh'),
//     //   GamePlayer(id: "2", name: 'Ahmad'),
//     //   GamePlayer(id: "3", name: 'Omar'),
//     //   GamePlayer(id: "4", name: 'Aasa'),
//     // ];

//     // context.push('/voting', extra: players);

//     return Scaffold(
//       backgroundColor: Colors.yellow[100],
//       body: Column(
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 Text(
//                   'IMPOSTER',
//                   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.push('/how-to-play');
//                   },
//                   child: const Text('How to Play'),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.push('/set-up-game');
//                   },
//                   child: const Text('Set Up Game'),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.push('/get-roles');
//                   },
//                   child: const Text('Game Cards'),
//                 ),
//                 SizedBox(height: 20),
//                 LanguageButton(),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.push('/talking');
//                   },
//                   child: const Text('Talking'),
//                 ),
//                 SizedBox(height: 20),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //     context.push('/voting', extra: players);
//                 //   },
//                 //   child: const Text('Voting'),
//                 // ),
//                 // Text(l10n.hello),
//               ],
//             ),
//           ),
//         ],
//       ),

//     );
//   }
// }
