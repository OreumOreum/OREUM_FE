class StringUtils {
  String wordBreaks (String input) {
    return input.replaceAllMapped(RegExp(r'(\S)(?=\S)'), (m) => '${m[1]}\u200D');
  }
}