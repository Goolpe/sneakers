extension DoubleExt on double {
  String toCurrency({sign = '\$'}) {
    return '$sign${toStringAsFixed(2)}';
  }

  String cutTrailingZeros() {
    final regex = RegExp(r'([.]*0)(?!.*\d)');

    return toString().replaceAll(regex, '');
  }
}
