# 🕵️ who's sus

**who's sus** is a multiplayer social deduction and imposter-guessing game built with **Flutter**. It features Arabic and English localization, categorized word decks paired with custom artwork and JSON animations, and interactive gameplay screens including role reveals, timed discussions, and voting rounds.

## ✨ Features

* **Bilingual Support:** Full localization in English (`app_en.arb`) and Arabic (`app_ar.arb`) with dynamic locale switching.

* **Complete Game Flow:** Dedicated screens for Game Setup, Player Management, Card Flip/Role Reveal, Timed Discussion, Voting, and How to Play.

* **Categorized Word Decks:** Built-in categories (`game_words.dart`) paired with custom word illustrations (`assets/images/words/`).

* **Custom Interactive UI:** Includes a circular countdown timer (`circular_timer.dart`), scratch-to-reveal word cards (`scratch_word_card.dart`), custom game buttons, and JSON animations (`assets/json/`).

## 📁 Project Structure

```
who's-sus/
├── assets/
│   ├── images/          # Game icons, cards, player avatars, and word illustrations
│   └── json/            # Animation assets for game states and characters
├── lib/
│   ├── data/            # Game words and category datasets
│   ├── l10n/            # Localization files (Arabic & English)
│   ├── models/          # Data models (GamePlayer, GameRound, SecretWord, etc.)
│   ├── providers/       # State management (LocaleProvider)
│   ├── router/          # App navigation and routing
│   ├── screens/         # Main UI screens (Home, Setup, Players, Card Flip, Talking, Voting)
│   ├── utils/           # Constants and color palettes
│   └── widgets/         # Reusable custom widgets (CircularTimer, ScratchWordCard, etc.)
└── pubspec.yaml         # Project dependencies and asset declarations
```

## 🚀 Getting Started

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.

* An Android/iOS emulator, connected device, or desktop target configured.

### Installation & Run

1. **Clone the repository:**

   ```bash
   git clone https://github.com/<USERNAME>/whos-sus.git
   cd whos-sus
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the application:**

   ```bash
   flutter run
   ```

## 📝 Notes for Contributors

* Run `flutter clean` before committing if build artifacts appear, and ensure `.gitignore` excludes `build/`, `.dart_tool/`, and temporary `.log` files.

* To add new words or categories, update `lib/data/game_words.dart` along with their corresponding localized strings in `lib/l10n/` and images in `assets/images/words/`.
