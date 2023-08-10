import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aminate/routes/index.dart';
import 'package:flutter_aminate/reducer/page.dart';
import 'package:flutter_aminate/constant/assets.dart';
import 'package:provider/provider.dart';

class Animate extends StatefulWidget {
  const Animate({super.key});

  @override
  AnimateState createState() => AnimateState();
}

class AnimateState extends State<Animate> {
  PageController pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // 手动跳转到指定页
  void goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<PageReducer>(context);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: pageController,
              onPageChanged: (int page) {
                pageModel.setPage(page);
              },
              itemCount: animateList.length,
              itemBuilder: (context, index) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget tchild, Animation<double> animation) {
                    // 先淡入淡出，再放大缩小
                    return ScaleTransition(
                        scale: Tween<double>(begin: 0, end: 1.0)
                            .animate(animation),
                        child: FadeTransition(
                          opacity: animation,
                          child: tchild,
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    key: ValueKey<int>(pageModel.curPage),
                    children: [
                      InkWell(
                        // hero动画
                        child: Hero(
                          tag: animateList[index].id,
                          child: Image(
                            image: AssetImage(animateList[index].url),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                        ),
                        onTap: () {
                          Routes.navigateTo(context, 'imageHero', params: {
                            'id': animateList[pageModel.curPage].id
                          });
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                        animateList[index].description,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 50,
              child: Row(children: [
                // pc端，PageView无法滑动，可通过点击底部的图标切换
                ...animateList.asMap().entries.map(
                      (child) => Container(
                        width: child.key == pageModel.curPage ? 15 : 5,
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    )
              ]),
            ),
            pageModel.curPage == 0
                ? const SizedBox.shrink()
                : Positioned(
                    left: 20,
                    child: IconButton(
                      onPressed: () {
                        goToPage(pageModel.curPage - 1);
                      },
                      color: Colors.white,
                      icon: const Icon(CupertinoIcons.left_chevron),
                    )),
            pageModel.curPage == animateList.length - 1
                ? const SizedBox.shrink()
                : Positioned(
                    right: 20,
                    child: IconButton(
                      onPressed: () {
                        goToPage(pageModel.curPage + 1);
                      },
                      color: Colors.white,
                      icon: const Icon(CupertinoIcons.right_chevron),
                    )),
          ],
        ));
  }
}
