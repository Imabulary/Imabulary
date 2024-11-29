class Either<L, R> {
  final L? left;
  final R? right;

  Either._({this.right, this.left});

  factory Either.fromLeft(L left) {
    return Either._(left: left);
  }

  factory Either.fromRight(R right) {
    return Either._(right: right);
  }

  bool get isLeft => left != null;
  bool get isRight => right != null;
}
