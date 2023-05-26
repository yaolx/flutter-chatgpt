import 'package:flutter_chatgpt/utils/request.dart';

class PoetryApi {
  static Future getPoetryList() async {
    final list = await Request.get('/issues');
    return list;
  }
}
