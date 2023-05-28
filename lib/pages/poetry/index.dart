import 'package:flutter_chatgpt/model/poetry.dart';
import 'package:flutter_chatgpt/api/poetry.dart';
import 'package:flutter/material.dart';

class Poetry extends StatefulWidget {
  const Poetry({super.key});

  @override
  State<Poetry> createState() => _ChatPageState();
}

class _ChatPageState extends State<Poetry> {
  late List _poetryList = <PoetryModel>[];
  late int _curPage = 1;

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
                  PageView(
                    controller: PageController(
                      viewportFraction: 1,
                    ),
                    onPageChanged: (int index) {
                      setState(() {
                        _curPage = index + 1;
                      });
                    },
                    children: <Widget>[
                      ..._poetryList.map(
                        (poetry) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                poetry['title'],
                              ),
                              Text(
                                poetry['body'],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
