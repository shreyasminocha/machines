{ vscode-marketplace, ... }:
{
  extensions = with vscode-marketplace; [
    gruntfuggly.todo-tree
  ];
  settings = {
    "todo-tree.customHighlight" = {
      TODO = {
      };
      FIXME = {
      };
    };
    "todo-tree.defaultHighlight" = {
      foreground = "green";
      type = "none";
    };
    "todo-tree.highlights.customHighlight" = {
      TODO = {
      };
      FIXME = {
      };
    };
    "todo-tree.highlights.defaultHighlight" = {
      foreground = "green";
      type = "none";
    };
  };
}
