import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/utils/cahce.dart';
import 'package:flutter_chatgpt/api/chat.dart';
import 'package:flutter_chatgpt/routes/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _gitHubTokenController = TextEditingController();
  final TextEditingController _gitHubRepoController = TextEditingController();
  late ChatApi chatApi;

  String _textError = '';

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  void _onLogin(key, token, repo) {
    // 重置
    AppCache.setOpenAiApiKey(key);
    AppCache.setGithubToken(token);
    AppCache.setGithubRepo(repo);
    try {
      chatApi = ChatApi(AppCache.openAiApiKey);
      Routes.navigateTo(context, Routes.chat);
    } catch (e) {
      setState(() {
        _textError = '无效的openai_key，请重新输入';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('登录'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                onChanged: (v) {
                  setState(() {
                    _textError = '';
                  });
                },
                controller: _apiKeyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'openAiApiKey',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                controller: _gitHubTokenController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'gitHubToken',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                controller: _gitHubRepoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'gitHubRepo，如：yaolx/poetry',
                ),
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: Center(
                child: Text(
                  _textError,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                _onLogin(_apiKeyController.text, _gitHubTokenController.text,
                    _gitHubRepoController.text);
              },
              child: const Text('登录'),
            ),
          ],
        ),
      ),
    );
  }
}
