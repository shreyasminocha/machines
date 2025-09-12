{ pkgs, ... }:
{
  extensions = with pkgs.vscode-marketplace; [
    fabiospampinato.vscode-todo-plus
  ];
  settings = {
    "todo.file.name" = "stuff.todo";
    "todo.symbols.box" = "[ ]";
    "todo.timekeeping.finished.format" = "YYYY-MM-DD HH:mm";
    "todo.timekeeping.started.format" = "YYYY-MM-DD HH:mm";
    "todo.timekeeping.created.format" = "YYYY-MM-DD HH:mm";
    "todo.symbols.done" = "[x]";
    "todo.symbols.cancelled" = "[-]";
    "todo.embedded.provider" = "rg";
    "todo.embedded.providers.rg.regex" =
      "(?:#|// @|//|%|/\\*+|<!--|--|\\* @|\\{!|\\{\\{!--|\\{\\{!) *\\\\?(TODO|FIXME|FIX|BUG|UGLY|HACK|NOTE|IDEA|REVIEW|DEBUG|OPTIMIZE)";
    "todo.embedded.regex" =
      "(?:<!-- *)?(?:#|// @|//|%|/\\*+|<!--|--|\\* @|\\{!|\\{\\{!--|\\{\\{!) *\\\\?(TODO|FIXME|FIX|BUG|UGLY|HACK|NOTE|IDEA|REVIEW|DEBUG|OPTIMIZE)(?:\\s*\\([^)]+\\))?(?::|{)?(?!\\w)(?: *-->| *\\*/| *!}| *--}}| *}}|(?= *(?:[^:]//|/\\*+|<!--|@|--|\\{!|\\{\\{!--|\\{\\{!))|((?: +[^\\n@]*?)(?= *(?:[^:]//|/\\*+|<!--|@|--(?!>)|\\{!|\\{\\{!--|\\{\\{!))|(?: +[^@\\n]+)?))";
    "todo.file.defaultContent" = "[ ] Item";
  };
}
