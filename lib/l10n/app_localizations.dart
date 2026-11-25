import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Guess the Imposter'**
  String get appTitle;

  /// No description provided for @startGame.
  ///
  /// In en, this message translates to:
  /// **'START GAME'**
  String get startGame;

  /// No description provided for @youAreThe.
  ///
  /// In en, this message translates to:
  /// **'YOU ARE THE'**
  String get youAreThe;

  /// No description provided for @imposter.
  ///
  /// In en, this message translates to:
  /// **'IMPOSTER'**
  String get imposter;

  /// No description provided for @youAreTheImposter.
  ///
  /// In en, this message translates to:
  /// **'YOU ARE THE IMPOSTER!'**
  String get youAreTheImposter;

  /// No description provided for @vote.
  ///
  /// In en, this message translates to:
  /// **'Vote Now'**
  String get vote;

  /// No description provided for @talking.
  ///
  /// In en, this message translates to:
  /// **'Talking ...'**
  String get talking;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get gotIt;

  /// No description provided for @players.
  ///
  /// In en, this message translates to:
  /// **'Players'**
  String get players;

  /// No description provided for @roundTime.
  ///
  /// In en, this message translates to:
  /// **'Round Time (minutes)'**
  String get roundTime;

  /// No description provided for @imposters.
  ///
  /// In en, this message translates to:
  /// **'Imposters'**
  String get imposters;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @setUpYourGame.
  ///
  /// In en, this message translates to:
  /// **'Set Up Your Game'**
  String get setUpYourGame;

  /// No description provided for @nextPlayer.
  ///
  /// In en, this message translates to:
  /// **'Next Player'**
  String get nextPlayer;

  /// No description provided for @howToPlay.
  ///
  /// In en, this message translates to:
  /// **'HOW TO PLAY?'**
  String get howToPlay;

  /// No description provided for @getYourRole.
  ///
  /// In en, this message translates to:
  /// **'GET YOUR ROLE'**
  String get getYourRole;

  /// No description provided for @getYourRoleDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive your card and secretly discover your role. Everyone gets the same word — except the Imposter.'**
  String get getYourRoleDescription;

  /// No description provided for @giveAClue.
  ///
  /// In en, this message translates to:
  /// **'GIVE A CLUE'**
  String get giveAClue;

  /// No description provided for @giveAClueDescription.
  ///
  /// In en, this message translates to:
  /// **'Take turns saying one word that describes the hidden word. Imposter: Blend in and try to discover the word.'**
  String get giveAClueDescription;

  /// No description provided for @finalGuess.
  ///
  /// In en, this message translates to:
  /// **'FINAL GUESS!'**
  String get finalGuess;

  /// No description provided for @surviveOrEliminate.
  ///
  /// In en, this message translates to:
  /// **'SURVIVE OR ELIMINATE!'**
  String get surviveOrEliminate;

  /// No description provided for @votingInstructions.
  ///
  /// In en, this message translates to:
  /// **'When it\'s time to vote, choose the player you suspect is the Imposter. The player with the most votes is caught.'**
  String get votingInstructions;

  /// No description provided for @impostorLastChance.
  ///
  /// In en, this message translates to:
  /// **'The caught Imposter gets one chance to guess the hidden word.'**
  String get impostorLastChance;

  /// No description provided for @correctGuessRule.
  ///
  /// In en, this message translates to:
  /// **'Correct guess? The Imposter stays. Wrong guess? The Imposter is eliminated.'**
  String get correctGuessRule;

  /// No description provided for @dontLetThemCatchYou.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Let Them Catch You!'**
  String get dontLetThemCatchYou;

  /// No description provided for @playerNumber.
  ///
  /// In en, this message translates to:
  /// **'Player {number}'**
  String playerNumber(int number);

  /// No description provided for @addPlayerList.
  ///
  /// In en, this message translates to:
  /// **'Add player names'**
  String get addPlayerList;

  /// No description provided for @deletePlayerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete player'**
  String get deletePlayerTooltip;

  /// No description provided for @addPlayerButton.
  ///
  /// In en, this message translates to:
  /// **'Add Player'**
  String get addPlayerButton;

  /// No description provided for @minPlayersWarning.
  ///
  /// In en, this message translates to:
  /// **'Add at least 3 players'**
  String get minPlayersWarning;

  /// No description provided for @savePlayersButton.
  ///
  /// In en, this message translates to:
  /// **'Save Players'**
  String get savePlayersButton;

  /// No description provided for @dialogTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Player'**
  String get dialogTitleAdd;

  /// No description provided for @dialogTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Name'**
  String get dialogTitleEdit;

  /// No description provided for @playerNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Player Name'**
  String get playerNameLabel;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter player name'**
  String get validationRequired;

  /// No description provided for @validationDuplicate.
  ///
  /// In en, this message translates to:
  /// **'This name is already in use'**
  String get validationDuplicate;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @tapToFlip.
  ///
  /// In en, this message translates to:
  /// **'Tap To Flip'**
  String get tapToFlip;

  /// No description provided for @gameOver.
  ///
  /// In en, this message translates to:
  /// **'Game Over!'**
  String get gameOver;

  /// No description provided for @categoryAnimals.
  ///
  /// In en, this message translates to:
  /// **'Animals'**
  String get categoryAnimals;

  /// No description provided for @categoryFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get categoryFood;

  /// No description provided for @categoryPlaces.
  ///
  /// In en, this message translates to:
  /// **'Places'**
  String get categoryPlaces;

  /// No description provided for @categoryJobs.
  ///
  /// In en, this message translates to:
  /// **'Jobs'**
  String get categoryJobs;

  /// No description provided for @gameWordWatermelon.
  ///
  /// In en, this message translates to:
  /// **'Watermelon'**
  String get gameWordWatermelon;

  /// No description provided for @gameHintWatermelon.
  ///
  /// In en, this message translates to:
  /// **'Summer'**
  String get gameHintWatermelon;

  /// No description provided for @gameWordGrapes.
  ///
  /// In en, this message translates to:
  /// **'Grapes'**
  String get gameWordGrapes;

  /// No description provided for @gameHintGrapes.
  ///
  /// In en, this message translates to:
  /// **'Bunch'**
  String get gameHintGrapes;

  /// No description provided for @gameWordEgg.
  ///
  /// In en, this message translates to:
  /// **'Fried egg'**
  String get gameWordEgg;

  /// No description provided for @gameHintEgg.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get gameHintEgg;

  /// No description provided for @gameWordSandwich.
  ///
  /// In en, this message translates to:
  /// **'Sandwich'**
  String get gameWordSandwich;

  /// No description provided for @gameHintSandwich.
  ///
  /// In en, this message translates to:
  /// **'Quick meal'**
  String get gameHintSandwich;

  /// No description provided for @gameWordDonut.
  ///
  /// In en, this message translates to:
  /// **'Donut'**
  String get gameWordDonut;

  /// No description provided for @gameHintDonut.
  ///
  /// In en, this message translates to:
  /// **'Sweets'**
  String get gameHintDonut;

  /// No description provided for @gameWordCheese.
  ///
  /// In en, this message translates to:
  /// **'Cheese'**
  String get gameWordCheese;

  /// No description provided for @gameHintCheese.
  ///
  /// In en, this message translates to:
  /// **'Milk'**
  String get gameHintCheese;

  /// No description provided for @gameWordBanana.
  ///
  /// In en, this message translates to:
  /// **'Banana'**
  String get gameWordBanana;

  /// No description provided for @gameHintBanana.
  ///
  /// In en, this message translates to:
  /// **'Tropical fruit'**
  String get gameHintBanana;

  /// No description provided for @gameWordCarrot.
  ///
  /// In en, this message translates to:
  /// **'Carrot'**
  String get gameWordCarrot;

  /// No description provided for @gameHintCarrot.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get gameHintCarrot;

  /// No description provided for @gameWordCake.
  ///
  /// In en, this message translates to:
  /// **'Cake'**
  String get gameWordCake;

  /// No description provided for @gameHintCake.
  ///
  /// In en, this message translates to:
  /// **'Celebration'**
  String get gameHintCake;

  /// No description provided for @gameWordBurger.
  ///
  /// In en, this message translates to:
  /// **'Burger'**
  String get gameWordBurger;

  /// No description provided for @gameHintBurger.
  ///
  /// In en, this message translates to:
  /// **'Quick meal'**
  String get gameHintBurger;

  /// No description provided for @gameWordIceCream.
  ///
  /// In en, this message translates to:
  /// **'Ice cream'**
  String get gameWordIceCream;

  /// No description provided for @gameHintIceCream.
  ///
  /// In en, this message translates to:
  /// **'Summer'**
  String get gameHintIceCream;

  /// No description provided for @gameWordPizza.
  ///
  /// In en, this message translates to:
  /// **'Pizza'**
  String get gameWordPizza;

  /// No description provided for @gameHintPizza.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get gameHintPizza;

  /// No description provided for @gameWordBread.
  ///
  /// In en, this message translates to:
  /// **'Bread'**
  String get gameWordBread;

  /// No description provided for @gameHintBread.
  ///
  /// In en, this message translates to:
  /// **'Oven'**
  String get gameHintBread;

  /// No description provided for @gameWordApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get gameWordApple;

  /// No description provided for @gameHintApple.
  ///
  /// In en, this message translates to:
  /// **'Orchard'**
  String get gameHintApple;

  /// No description provided for @gameWordPotato.
  ///
  /// In en, this message translates to:
  /// **'Potato'**
  String get gameWordPotato;

  /// No description provided for @gameHintPotato.
  ///
  /// In en, this message translates to:
  /// **'Underground'**
  String get gameHintPotato;

  /// No description provided for @gameWordZebra.
  ///
  /// In en, this message translates to:
  /// **'Zebra'**
  String get gameWordZebra;

  /// No description provided for @gameHintZebra.
  ///
  /// In en, this message translates to:
  /// **'Savanna'**
  String get gameHintZebra;

  /// No description provided for @gameWordTurtle.
  ///
  /// In en, this message translates to:
  /// **'Turtle'**
  String get gameWordTurtle;

  /// No description provided for @gameHintTurtle.
  ///
  /// In en, this message translates to:
  /// **'Reptiles'**
  String get gameHintTurtle;

  /// No description provided for @gameWordMonkey.
  ///
  /// In en, this message translates to:
  /// **'Monkey'**
  String get gameWordMonkey;

  /// No description provided for @gameHintMonkey.
  ///
  /// In en, this message translates to:
  /// **'Trees'**
  String get gameHintMonkey;

  /// No description provided for @gameWordPenguin.
  ///
  /// In en, this message translates to:
  /// **'Penguin'**
  String get gameWordPenguin;

  /// No description provided for @gameHintPenguin.
  ///
  /// In en, this message translates to:
  /// **'Cold'**
  String get gameHintPenguin;

  /// No description provided for @gameWordTiger.
  ///
  /// In en, this message translates to:
  /// **'Tiger'**
  String get gameWordTiger;

  /// No description provided for @gameHintTiger.
  ///
  /// In en, this message translates to:
  /// **'Predator'**
  String get gameHintTiger;

  /// No description provided for @gameWordGiraffe.
  ///
  /// In en, this message translates to:
  /// **'Giraffe'**
  String get gameWordGiraffe;

  /// No description provided for @gameHintGiraffe.
  ///
  /// In en, this message translates to:
  /// **'Savanna'**
  String get gameHintGiraffe;

  /// No description provided for @gameWordPanda.
  ///
  /// In en, this message translates to:
  /// **'Panda'**
  String get gameWordPanda;

  /// No description provided for @gameHintPanda.
  ///
  /// In en, this message translates to:
  /// **'Asia'**
  String get gameHintPanda;

  /// No description provided for @gameWordFox.
  ///
  /// In en, this message translates to:
  /// **'Fox'**
  String get gameWordFox;

  /// No description provided for @gameHintFox.
  ///
  /// In en, this message translates to:
  /// **'Wild animal'**
  String get gameHintFox;

  /// No description provided for @gameWordBear.
  ///
  /// In en, this message translates to:
  /// **'Bear'**
  String get gameWordBear;

  /// No description provided for @gameHintBear.
  ///
  /// In en, this message translates to:
  /// **'Forest'**
  String get gameHintBear;

  /// No description provided for @gameWordDog.
  ///
  /// In en, this message translates to:
  /// **'Dog'**
  String get gameWordDog;

  /// No description provided for @gameHintDog.
  ///
  /// In en, this message translates to:
  /// **'Pet'**
  String get gameHintDog;

  /// No description provided for @gameWordHorse.
  ///
  /// In en, this message translates to:
  /// **'Horse'**
  String get gameWordHorse;

  /// No description provided for @gameHintHorse.
  ///
  /// In en, this message translates to:
  /// **'Racing'**
  String get gameHintHorse;

  /// No description provided for @gameWordRabbit.
  ///
  /// In en, this message translates to:
  /// **'Rabbit'**
  String get gameWordRabbit;

  /// No description provided for @gameHintRabbit.
  ///
  /// In en, this message translates to:
  /// **'Burrows'**
  String get gameHintRabbit;

  /// No description provided for @gameWordElephant.
  ///
  /// In en, this message translates to:
  /// **'Elephant'**
  String get gameWordElephant;

  /// No description provided for @gameHintElephant.
  ///
  /// In en, this message translates to:
  /// **'Huge'**
  String get gameHintElephant;

  /// No description provided for @gameWordLion.
  ///
  /// In en, this message translates to:
  /// **'Lion'**
  String get gameWordLion;

  /// No description provided for @gameHintLion.
  ///
  /// In en, this message translates to:
  /// **'Predator'**
  String get gameHintLion;

  /// No description provided for @gameWordCat.
  ///
  /// In en, this message translates to:
  /// **'Cat'**
  String get gameWordCat;

  /// No description provided for @gameHintCat.
  ///
  /// In en, this message translates to:
  /// **'Pet'**
  String get gameHintCat;

  /// No description provided for @gameWordBakery.
  ///
  /// In en, this message translates to:
  /// **'Bakery'**
  String get gameWordBakery;

  /// No description provided for @gameHintBakery.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get gameHintBakery;

  /// No description provided for @gameWordStadium.
  ///
  /// In en, this message translates to:
  /// **'Stadium'**
  String get gameWordStadium;

  /// No description provided for @gameHintStadium.
  ///
  /// In en, this message translates to:
  /// **'Crowd'**
  String get gameHintStadium;

  /// No description provided for @gameWordZoo.
  ///
  /// In en, this message translates to:
  /// **'Zoo'**
  String get gameWordZoo;

  /// No description provided for @gameHintZoo.
  ///
  /// In en, this message translates to:
  /// **'Family outing'**
  String get gameHintZoo;

  /// No description provided for @gameWordHotel.
  ///
  /// In en, this message translates to:
  /// **'Hotel'**
  String get gameWordHotel;

  /// No description provided for @gameHintHotel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get gameHintHotel;

  /// No description provided for @gameWordCinema.
  ///
  /// In en, this message translates to:
  /// **'Cinema'**
  String get gameWordCinema;

  /// No description provided for @gameHintCinema.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get gameHintCinema;

  /// No description provided for @gameWordSupermarket.
  ///
  /// In en, this message translates to:
  /// **'Supermarket'**
  String get gameWordSupermarket;

  /// No description provided for @gameHintSupermarket.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get gameHintSupermarket;

  /// No description provided for @gameWordTrainStation.
  ///
  /// In en, this message translates to:
  /// **'Train station'**
  String get gameWordTrainStation;

  /// No description provided for @gameHintTrainStation.
  ///
  /// In en, this message translates to:
  /// **'Journeys'**
  String get gameHintTrainStation;

  /// No description provided for @gameWordLibrary.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get gameWordLibrary;

  /// No description provided for @gameHintLibrary.
  ///
  /// In en, this message translates to:
  /// **'Quiet'**
  String get gameHintLibrary;

  /// No description provided for @gameWordMuseum.
  ///
  /// In en, this message translates to:
  /// **'Museum'**
  String get gameWordMuseum;

  /// No description provided for @gameHintMuseum.
  ///
  /// In en, this message translates to:
  /// **'The past'**
  String get gameHintMuseum;

  /// No description provided for @gameWordPark.
  ///
  /// In en, this message translates to:
  /// **'Park'**
  String get gameWordPark;

  /// No description provided for @gameHintPark.
  ///
  /// In en, this message translates to:
  /// **'Outdoors'**
  String get gameHintPark;

  /// No description provided for @gameWordRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get gameWordRestaurant;

  /// No description provided for @gameHintRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get gameHintRestaurant;

  /// No description provided for @gameWordBeach.
  ///
  /// In en, this message translates to:
  /// **'Beach'**
  String get gameWordBeach;

  /// No description provided for @gameHintBeach.
  ///
  /// In en, this message translates to:
  /// **'Vacation'**
  String get gameHintBeach;

  /// No description provided for @gameWordAirport.
  ///
  /// In en, this message translates to:
  /// **'Airport'**
  String get gameWordAirport;

  /// No description provided for @gameHintAirport.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get gameHintAirport;

  /// No description provided for @gameWordHospital.
  ///
  /// In en, this message translates to:
  /// **'Hospital'**
  String get gameWordHospital;

  /// No description provided for @gameHintHospital.
  ///
  /// In en, this message translates to:
  /// **'Care'**
  String get gameHintHospital;

  /// No description provided for @gameWordSchool.
  ///
  /// In en, this message translates to:
  /// **'School'**
  String get gameWordSchool;

  /// No description provided for @gameHintSchool.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get gameHintSchool;

  /// No description provided for @gameWordBaker.
  ///
  /// In en, this message translates to:
  /// **'Baker'**
  String get gameWordBaker;

  /// No description provided for @gameHintBaker.
  ///
  /// In en, this message translates to:
  /// **'Dough'**
  String get gameHintBaker;

  /// No description provided for @gameWordPhotographer.
  ///
  /// In en, this message translates to:
  /// **'Photographer'**
  String get gameWordPhotographer;

  /// No description provided for @gameHintPhotographer.
  ///
  /// In en, this message translates to:
  /// **'Memories'**
  String get gameHintPhotographer;

  /// No description provided for @gameWordPainter.
  ///
  /// In en, this message translates to:
  /// **'Painter'**
  String get gameWordPainter;

  /// No description provided for @gameHintPainter.
  ///
  /// In en, this message translates to:
  /// **'Creativity'**
  String get gameHintPainter;

  /// No description provided for @gameWordAstronaut.
  ///
  /// In en, this message translates to:
  /// **'Astronaut'**
  String get gameWordAstronaut;

  /// No description provided for @gameHintAstronaut.
  ///
  /// In en, this message translates to:
  /// **'Exploration'**
  String get gameHintAstronaut;

  /// No description provided for @gameWordDentist.
  ///
  /// In en, this message translates to:
  /// **'Dentist'**
  String get gameWordDentist;

  /// No description provided for @gameHintDentist.
  ///
  /// In en, this message translates to:
  /// **'Smile'**
  String get gameHintDentist;

  /// No description provided for @gameWordPoliceOfficer.
  ///
  /// In en, this message translates to:
  /// **'Police officer'**
  String get gameWordPoliceOfficer;

  /// No description provided for @gameHintPoliceOfficer.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get gameHintPoliceOfficer;

  /// No description provided for @gameWordScientist.
  ///
  /// In en, this message translates to:
  /// **'Scientist'**
  String get gameWordScientist;

  /// No description provided for @gameHintScientist.
  ///
  /// In en, this message translates to:
  /// **'Experiments'**
  String get gameHintScientist;

  /// No description provided for @gameWordFarmer.
  ///
  /// In en, this message translates to:
  /// **'Farmer'**
  String get gameWordFarmer;

  /// No description provided for @gameHintFarmer.
  ///
  /// In en, this message translates to:
  /// **'Land'**
  String get gameHintFarmer;

  /// No description provided for @gameWordMechanic.
  ///
  /// In en, this message translates to:
  /// **'Mechanic'**
  String get gameWordMechanic;

  /// No description provided for @gameHintMechanic.
  ///
  /// In en, this message translates to:
  /// **'Repairs'**
  String get gameHintMechanic;

  /// No description provided for @gameWordFirefighter.
  ///
  /// In en, this message translates to:
  /// **'Firefighter'**
  String get gameWordFirefighter;

  /// No description provided for @gameHintFirefighter.
  ///
  /// In en, this message translates to:
  /// **'Rescue'**
  String get gameHintFirefighter;

  /// No description provided for @gameWordChef.
  ///
  /// In en, this message translates to:
  /// **'Chef'**
  String get gameWordChef;

  /// No description provided for @gameHintChef.
  ///
  /// In en, this message translates to:
  /// **'Flavors'**
  String get gameHintChef;

  /// No description provided for @gameWordPilot.
  ///
  /// In en, this message translates to:
  /// **'Pilot'**
  String get gameWordPilot;

  /// No description provided for @gameHintPilot.
  ///
  /// In en, this message translates to:
  /// **'Journeys'**
  String get gameHintPilot;

  /// No description provided for @gameWordEngineer.
  ///
  /// In en, this message translates to:
  /// **'Engineer'**
  String get gameWordEngineer;

  /// No description provided for @gameHintEngineer.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get gameHintEngineer;

  /// No description provided for @gameWordTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get gameWordTeacher;

  /// No description provided for @gameHintTeacher.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get gameHintTeacher;

  /// No description provided for @gameWordDoctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get gameWordDoctor;

  /// No description provided for @gameHintDoctor.
  ///
  /// In en, this message translates to:
  /// **'Care'**
  String get gameHintDoctor;

  /// No description provided for @hintLabel.
  ///
  /// In en, this message translates to:
  /// **'Hint: {hint}'**
  String hintLabel(String hint);

  /// No description provided for @passPhoneToNextPlayer.
  ///
  /// In en, this message translates to:
  /// **'Pass phone to the next player'**
  String get passPhoneToNextPlayer;

  /// No description provided for @rememberUrCard.
  ///
  /// In en, this message translates to:
  /// **'Remember your card, then hide it using the button'**
  String get rememberUrCard;

  /// No description provided for @flipToRevealSecretWord.
  ///
  /// In en, this message translates to:
  /// **'Flip to reveal your secret word'**
  String get flipToRevealSecretWord;

  /// No description provided for @getReady.
  ///
  /// In en, this message translates to:
  /// **'GET READY!!'**
  String get getReady;

  /// No description provided for @roundTimer.
  ///
  /// In en, this message translates to:
  /// **'Round {number} Timer'**
  String roundTimer(int number);

  /// No description provided for @roundTimerLabel.
  ///
  /// In en, this message translates to:
  /// **'Round Timer'**
  String get roundTimerLabel;

  /// No description provided for @discussion.
  ///
  /// In en, this message translates to:
  /// **'Discussion!'**
  String get discussion;

  /// No description provided for @discussionInstructions.
  ///
  /// In en, this message translates to:
  /// **'Each person takes turns saying exactly one word related to the secret word.'**
  String get discussionInstructions;

  /// No description provided for @timeOver.
  ///
  /// In en, this message translates to:
  /// **'Time Over!'**
  String get timeOver;

  /// No description provided for @whoIsTheImposter.
  ///
  /// In en, this message translates to:
  /// **'Who do you think is the IMPOSTER?'**
  String get whoIsTheImposter;

  /// No description provided for @theImposterIs.
  ///
  /// In en, this message translates to:
  /// **'The Imposter is: '**
  String get theImposterIs;

  /// No description provided for @reveal.
  ///
  /// In en, this message translates to:
  /// **'REVEAL'**
  String get reveal;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT'**
  String get submit;

  /// No description provided for @youCaughtTheImposter.
  ///
  /// In en, this message translates to:
  /// **'You caught the Imposter!'**
  String get youCaughtTheImposter;

  /// No description provided for @theActualImposterIs.
  ///
  /// In en, this message translates to:
  /// **'The Actual Imposter is :'**
  String get theActualImposterIs;

  /// No description provided for @oneChanceToGuess.
  ///
  /// In en, this message translates to:
  /// **'Player {number}, you have one chance! Can you guess the secret word?'**
  String oneChanceToGuess(int number);

  /// No description provided for @itIsATie.
  ///
  /// In en, this message translates to:
  /// **'IT IS A TIE!'**
  String get itIsATie;

  /// No description provided for @caught.
  ///
  /// In en, this message translates to:
  /// **'CAUGHT!'**
  String get caught;

  /// No description provided for @votedForImposter.
  ///
  /// In en, this message translates to:
  /// **'You voted for the imposter!'**
  String get votedForImposter;

  /// No description provided for @votedForWrongPerson.
  ///
  /// In en, this message translates to:
  /// **'You voted for the wrong person!'**
  String get votedForWrongPerson;

  /// No description provided for @writeItDown.
  ///
  /// In en, this message translates to:
  /// **'Write it down ...'**
  String get writeItDown;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get continueAction;

  /// No description provided for @wrongVoteMessage.
  ///
  /// In en, this message translates to:
  /// **'You voted for the wrong player. The Imposter is still in the game!'**
  String get wrongVoteMessage;

  /// No description provided for @imposterEscaped.
  ///
  /// In en, this message translates to:
  /// **'THE Imposter ESCAPED!'**
  String get imposterEscaped;

  /// No description provided for @scratchToReveal.
  ///
  /// In en, this message translates to:
  /// **'Scratch to reveal'**
  String get scratchToReveal;

  /// No description provided for @correctSecretWordGuessMessage.
  ///
  /// In en, this message translates to:
  /// **'Player {number}, you guessed the secret word! You are still in the game!'**
  String correctSecretWordGuessMessage(int number);

  /// No description provided for @playAgain.
  ///
  /// In en, this message translates to:
  /// **'PLAY AGAIN'**
  String get playAgain;

  /// No description provided for @secretWordWithValue.
  ///
  /// In en, this message translates to:
  /// **'Secret word: “{word}”'**
  String secretWordWithValue(String word);

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @weHaveAWinner.
  ///
  /// In en, this message translates to:
  /// **'We have a Winner!'**
  String get weHaveAWinner;

  /// No description provided for @yourSecretWordIs.
  ///
  /// In en, this message translates to:
  /// **'Your secret word is:'**
  String get yourSecretWordIs;

  /// No description provided for @revealWord.
  ///
  /// In en, this message translates to:
  /// **'Reveal word'**
  String get revealWord;

  /// No description provided for @secretWordLabel.
  ///
  /// In en, this message translates to:
  /// **'Secret word: {word}'**
  String secretWordLabel(String word);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
