class TextFormatter {
  String capitalizeFirstWord(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return '';
    }

    final words = trimmed.split(' ');
    final firstWord = words.first;
    if (firstWord.isNotEmpty) {
      words[0] = '${firstWord[0].toUpperCase()}${firstWord.substring(1)}';
    }

    return words.join(' ');
  }
}
