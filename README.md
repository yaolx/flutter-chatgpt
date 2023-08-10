# flutter_aminate

学习 flutter 的同时，做一款简单的 chatgpt 应用，利用 flutter 的跨端能力，实现一套代码，多端适配。

古诗背诵，给小孩记录背诵过的古诗，方便后续复习。

## 功能开发

### 登录模块

1. openai_api_key： openai 里的 apikey，调用 openai 用
2. github_token：github setting 里创建的 token，用于调用 githubApi 接口
3. github_repo：对应 github 的工程，如：`yaolx/poetry`，可以自适应任何 github 工程

### 聊天模块

1. 输入古诗，openai 根据 prompt，查出对应的古诗句
2. 解析数据，对接 githubApi，提交内容到 issues 上

### 古诗列表

1. 展示 issues 数据，即录入的古诗数据
2. 古诗作者，朝代 ---todo
3. 点赞、评论功能 ---todo

### 统计古诗学习记录

## 部署

1. 利用 github action 的能力，实现 web 端自动部署到 github pages 上，访问`https://yaolx.github.io/flutter_aminate/`即可
2. 后续再研究 android、ios 打包能力 ---todo

## 总结

1. flutter 学习过程
2. 熟悉 flutter 组件
3. 增加多端开发经验
