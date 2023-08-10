import 'package:flutter/material.dart';
import 'package:flutter_aminate/constant/assets.dart';
import 'package:flutter_aminate/utils/string.dart';
import 'package:flutter_aminate/model/Animate.dart';

class ImageHero extends StatelessWidget {
  const ImageHero({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    // 根据id获取对应的图片对象
    final animate = animateList.firstWhere((element) => element.id == id,
        orElse: () => AnimateModel('', 'Not Found', ''));
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20.0, // 距离顶部的距离
          left: 20.0, // 距离左侧的距离
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white), // 设置背景颜色为白色
              // 可以在此设置其他样式，例如文字颜色、边框等
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '关闭',
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ),
        //  StringUtils.isNotNill(animate.id) 为空表示，没有取到id，异常处理，显示暂无数据
        StringUtils.isNotNill(animate.id)
            ? Hero(
                tag: id, //唯一标记，前后两个路由页Hero的tag必须相同
                child: Image.asset(animate.url),
              )
            : const Center(
                child: Text(
                  '暂无数据',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 16),
                ),
              ),
      ],
    );
  }
}
