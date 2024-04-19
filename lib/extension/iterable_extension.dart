// ignore_for_file: strict_raw_type

extension IterableExtension on Iterable {
  T? elementAtIndex<T>(int? index, [T? defaultValue]) =>
      index != null && index > -1 && index < length
          ? (elementAtOrNull(index) ?? defaultValue)
          : defaultValue;

  /// = true if all component of list == null
  bool get isListNull => every((item) => item == null);
}
