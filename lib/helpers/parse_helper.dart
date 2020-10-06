class ParseHelper {
  static double stringToDouble(String value) {
    return double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
  }

  static String doubleToString(double value) {
    return value.toStringAsFixed(2).replaceFirst(".", ",");
  }
}
