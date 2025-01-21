class Maybe<T> {
  late final T? _value;

  Maybe._(this._value);

  static Maybe<T> some<T>(T value) {
    if (value == null) {
      throw ArgumentError('Provided value cannot be empty');
    }

    return Maybe._(value);
  }

  static Maybe<T> none<T>() {
    return Maybe._(null);
  }

  static Maybe<T> fromValue<T>(T value) {
    return value != null ? Maybe.some(value) : Maybe.none<T>();
  }

  Maybe<R> map<R extends Object>(R Function(T) handler) {
    if (_value == null) {
      return Maybe.none<R>();
    }

    return Maybe.fromValue(handler(_value));
  }

  Maybe<R> flatMap<R>(Maybe<R> Function(T) handler) {
    if (_value == null) {
      return Maybe.none<R>();
    }

    return handler(_value);
  }

  T getOrElse(T defaultValue) {
    return _value ?? defaultValue;
  }
}
