import 'package:floor_calculator/helpers/parse_helper.dart';

class ValidatorHelper {
  static String isValidText(String text) {
    return text.isEmpty ? 'Campo obrigatório' : null;
  }

  static String isValidNumber(String text) {
    String textError = isValidText(text);
    if (textError != null) {
      return textError;
    }
    return ParseHelper.stringToDouble(text) <= 0 ? 'Número inválido' : null;
  }
}
