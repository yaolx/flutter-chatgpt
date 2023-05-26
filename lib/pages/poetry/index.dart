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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print(_poetryList);
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ..._poetryList.map(
                  (poetry) => Text(poetry['title']),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
