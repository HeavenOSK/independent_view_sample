class CountState {
  final int count;
  final bool loading;

  CountState({
    this.count = 0,
    this.loading = true,
  });

  CountState copyWith({
    bool loading,
    int count,
  }) {
    return CountState(
      count: count ?? this.count,
      loading: loading ?? this.loading,
    );
  }

  @override
  bool operator ==(other) => count == other.count && loading == other.loading;

  @override
  int get hashCode => count.hashCode ^ loading.hashCode;
}
