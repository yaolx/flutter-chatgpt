import 'package:flutter/material.dart';
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
      debugPrint(e as String?);
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

  //  封装设置githubToken的方法
  static Future<bool> setGithubToken(String value) async {
    return _pre.setString(CacheKey.githubToken, value);
  }

  //  封装清除githubToken的方法
  static Future<bool> cleanGithubToken() async {
    return await _pre.setString(CacheKey.githubToken, '');
  }

  //  封装获取githubToken的方法
  static String? get githubToken => _pre.getString(CacheKey.githubToken);

  //  封装设置githubRepo的方法
  static Future<bool> setGithubRepo(String value) async {
    return _pre.setString(CacheKey.githubRepo, value);
  }

  //  封装清除githubRepo的方法
  static Future<bool> cleanGithubRepo() async {
    return await _pre.setString(CacheKey.githubRepo, '');
  }

  //  封装获取githubRepo的方法
  static String? get githubRepo => _pre.getString(CacheKey.githubRepo);
}
