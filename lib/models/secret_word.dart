import 'localized_text.dart';

class SecretWord {
  final String id;
  final LocalizedText label;
  final LocalizedText hint;
  final String imageAsset;

  const SecretWord({
    required this.id,
    required this.label,
    required this.hint,
    required this.imageAsset,
  });
}
