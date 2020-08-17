import 'package:shared_preferences/shared_preferences.dart';

const _countKey = 'count';

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
