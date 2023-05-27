class StringUtils {
  // 判断字符串是否为null或者''
  static bool isNotNill(String? text) {
    return text?.isNotEmpty ?? false;
  }

  // 返回默认值
  static String setValue(String? text, defaultValue) {
    return isNotNill(text) ? text : defaultValue;
  }
}
