extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}

extension DoubleExtensions on double {
  bool get hasFractional => !(this is int || this == roundToDouble());
  bool get isInt => (this % 1) == 0 && hasFractional == false;
}
