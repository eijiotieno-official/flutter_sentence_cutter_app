class AppServices {
  static List<String> splitSentence(
      {required String longSentence, required int charCount}) {
    List<String> result = [];
    int currentIndex = 0;

    while (currentIndex < longSentence.length) {
      int endIndex = currentIndex + charCount;

      if (endIndex >= longSentence.length) {
        result.add(longSentence.substring(currentIndex));
        break;
      }

      int periodIndex = longSentence.lastIndexOf('.', endIndex);

      if (periodIndex != -1 && periodIndex >= currentIndex) {
        result
            .add("${longSentence.substring(currentIndex, periodIndex + 1)}...");
        currentIndex = periodIndex + 2; // Skip space after the period
      } else {
        result.add("${longSentence.substring(currentIndex, endIndex)}...");
        currentIndex = endIndex;
      }
    }

    if (result.isNotEmpty) {
      // Remove three dots from the last string and add a full stop
      String lastString = result.last;
      if (lastString.endsWith("...")) {
        lastString = "${lastString.substring(0, lastString.length - 3)}.";
        result[result.length - 1] = lastString;
      }
    }
    return result;
  }
}
