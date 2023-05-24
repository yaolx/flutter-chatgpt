import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chatgpt/constant/cache.dart';

class AppCache {
  final SharedPreferences sharedPreferences;

  AppCache._({required this.sharedPreferences});

  factory AppCache.create({
    required SharedPreferences sharedPreferences,
  }) =>
      AppCache._(
        sharedPreferences: sharedPreferences,
      );

  //  缓存类采取单例模式
  static AppCache? _instance;

  //  一定要在main里面初始化
  static Future<void> init() async {
    try {
      _instance ??= AppCache.create(
        sharedPreferences: await SharedPreferences.getInstance(),
      );
    } catch (e) {
      print(e);
    }
  }

  // 简化获取工具类的缓存实例，以便在下方封装一些方法
  static SharedPreferences get _pre => _instance!.sharedPreferences;

  //  封装设置token的方法
  static Future<bool> setOpenAiApiKey(String value) async {
    return await _pre.setString(CacheKey.openAiApiKey, value);
  }

  //  封装清除token的方法
  static Future<bool> cleanOpenAiApiKey() async {
    return await _pre.setString(CacheKey.openAiApiKey, '');
  }

  //  封装获取token的方法
  static String? get openAiApiKey => _pre.getString(CacheKey.openAiApiKey);

  //  封装设置phone的方法
  static Future<bool> setOpenAiOrg(String value) async {
    return _pre.setString(CacheKey.openAiOrg, value);
  }

  //  封装清除phone的方法
  static Future<bool> cleanOpenAiOrg() async {
    return await _pre.setString(CacheKey.openAiOrg, '');
  }

  //  封装获取phone的方法
  static String? get openAiOrg => _pre.getString(CacheKey.openAiOrg);
}
