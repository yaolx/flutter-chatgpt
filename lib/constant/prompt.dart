enum PromptType { poetry, none }

class Prompt {
  static const String poetry = '''
      你的任务是以一致的风格来回答问题
      根据题目查一首古诗，包括古诗的名称，作者，朝代。
      名称、作者、朝代在前面，诗内容在后面。
      题目，作者，朝代用【】包起来。
      模板如下：
      【静夜思】【李白】【唐代】
      床前明月光，疑是地上霜。
      举头望明月，低头思故乡。
    ''';
}
