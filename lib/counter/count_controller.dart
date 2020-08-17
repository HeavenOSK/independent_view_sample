import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:independent_view_sample/repositories/count_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'count_state.dart';

export 'count_state.dart';

final counterControllerProvider = StateNotifierProvider.autoDispose((ref) {
  return CountController(
    ref.read(counterRepositoryProvider),
  );
});

class CountController extends StateNotifier<CountState> {
  final CountRepository _countRepository;

  CountController(
    this._countRepository,
  ) : super(CountState()) {
    _load();
  }

  void _load() async {
    await Future.delayed(const Duration(seconds: 5));
    final count = (await _countRepository.getCount()) ?? 0;
    state = state.copyWith(
      loading: false,
      count: count,
    );
  }

  void increment() {
    if (state.loading) {
      return;
    }
    state = state.copyWith(
      count: state.count + 1,
    );
    _countRepository.saveCount(state.count);
  }
}
