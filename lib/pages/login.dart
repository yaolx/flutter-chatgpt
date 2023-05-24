import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/utils/cahce.dart';
import 'package:flutter_chatgpt/routes/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _apiKeyController = TextEditingController();

  final TextEditingController _orgController = TextEditingController();

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  void _onLogin(key, org) {
    print(key);
    // 重置
    AppCache.setOpenAiApiKey(key);
    AppCache.setOpenAiOrg(org);
    Routes.navigateTo(context, Routes.chat);
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
                controller: _apiKeyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'openAiApiKey',
                ),
              ),
            ),
            const SizedBox(
              width: 250,
              height: 50,
            ),
            SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                controller: _orgController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'openAiOrg',
                ),
              ),
            ),
            const SizedBox(
              width: 250,
              height: 50,
            ),
            FilledButton(
              onPressed: () {
                _onLogin(_apiKeyController.text, _orgController.text);
              },
              child: const Text('登录'),
            ),
          ],
        ),
      ),
    );
  }
}
