import 'package:flutter_chatgpt/model/poetry.dart';
import 'package:flutter_chatgpt/api/poetry.dart';
import 'package:flutter/material.dart';
import 'package:bookfx/bookfx.dart';

class Poetry extends StatefulWidget {
  const Poetry({super.key});

  @override
  State<Poetry> createState() => _ChatPageState();
}

class _ChatPageState extends State<Poetry> {
  late List _poetryList = <PoetryModel>[];
  late int _curPage = 1;
  EBookController eBookController = EBookController();
  BookController bookController = BookController();

  @override
  void initState() {
    super.initState();
    getList();
  }

  Future<void> getList() async {
    final List poetryList = await PoetryApi.getPoetryList();
    setState(() {
      _poetryList = poetryList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
        ),
        body: _poetryList.isEmpty
            ? null
            : Stack(
                children: [
                  BookFx(
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    pageCount: _poetryList.length,
                    currentPage: (index) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _poetryList[index]['title'],
                            ),
                            Text(
                              _poetryList[index]['body'],
                            ),
                          ],
                        ),
                      );
                    },
                    lastCallBack: (index) {
                      setState(() {
                        if (index != 0 && index != _curPage) {
                          _curPage = index;
                        }
                      });
                    },
                    nextCallBack: (index) {
                      setState(() {
                        if (index != _curPage) {
                          _curPage = index;
                        }
                      });
                    },
                    nextPage: (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('下一首：${_poetryList[index]['title']}')],
                      );
                    },
                    controller: bookController,
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Text('$_curPage/${_poetryList.length}'),
                  ),
                ],
              ));
  }
}
