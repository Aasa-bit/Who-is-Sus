import 'localized_text.dart';
import 'secret_word.dart';

class WordCategory {
  final String id;
  final LocalizedText label;
  final List<SecretWord> words;

  const WordCategory({
    required this.id,
    required this.label,
    required this.words,
  });
}
