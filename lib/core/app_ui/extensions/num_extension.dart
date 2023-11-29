part of 'extensions.dart';

extension NumberConverter on num {
  String toWeightString() {
    if (this < 1) {
      return '${(this * 1000).toStringAsFixed(0)} gm';
    } else {
      return '${toStringAsFixed(0)} kg';
    }
  }
}
