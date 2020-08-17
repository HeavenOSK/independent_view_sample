import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _countKey = 'count';

final counterRepositoryProvider = Provider((_) => CountRepository());

class CountRepository {
  Future<int> getCount() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getInt(_countKey);
  }

  Future<bool> saveCount(int count) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setInt(_countKey, count);
  }
}
