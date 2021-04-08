enum TextInputFormatterType { none, custom, money, phone }
enum InputValidatorType { email, empty, requiredField }

Map<InputValidatorType, Function(dynamic)> validator =
    <InputValidatorType, Function(dynamic)>{
  InputValidatorType.empty: (dynamic value) {
    if (value.toString().isEmpty) {
      return 'this field can\'t be empty';
    }
    return null;
  },
  InputValidatorType.requiredField: (dynamic value) {
    if (value.toString().isEmpty) {
      return 'this field is required';
    }
    return null;
  },
  InputValidatorType.email: (dynamic value) {
    bool validEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value.toString());
    if (!validEmail) {
      return 'invalid email';
    }
    return null;
  }
};

class InputValidator {
  static String validate(
    List<InputValidatorType> validators,
    dynamic value,
  ) {
    InputValidatorType _validator = validators.firstWhere(
      (InputValidatorType action) => validator[action](value) != null,
      orElse: () => null,
    );
    if (_validator != null) {
      return validator[_validator](value).toString();
    }
    return null;
  }
}
