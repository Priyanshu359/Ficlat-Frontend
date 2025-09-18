class Formatters {
  static String formatName(String name) {
    return name
        .trim()
        .split(" ")
        .map((str) {
          if (str.isEmpty) return "";
          return str[0].toUpperCase() + str.substring(1).toLowerCase();
        })
        .join(" ");
  }

  static String shortenText(String text, {int limit = 50}) {
    return text.length > limit ? "${text.substring(0, limit)}..." : text;
  }
}
