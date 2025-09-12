[
  {
    key = "alt+up";
    command = "-editor.action.moveLinesUpAction";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "alt+up";
    command = "editor.action.moveLinesUpAction";
    when = "editorTextFocus && !editorReadonly";
  }

  {
    key = "alt+down";
    command = "-editor.action.moveLinesDownAction";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "alt+down";
    command = "editor.action.moveLinesDownAction";
    when = "editorTextFocus && !editorReadonly";
  }

  {
    key = "ctrl+shift+up";
    command = "editor.action.insertCursorAbove";
    when = "editorTextFocus";
  }
  {
    key = "ctrl+shift+down";
    command = "editor.action.insertCursorBelow";
    when = "editorTextFocus";
  }

  {
    key = "ctrl+tab";
    command = "-workbench.action.openNextRecentlyUsedEditorInGroup";
  }
  {
    key = "ctrl+tab";
    command = "-workbench.action.quickOpenNavigateNextInEditorPicker";
    when = "inEditorsPicker && inQuickOpen";
  }
  {
    key = "ctrl+tab";
    command = "workbench.action.nextEditor";
  }

  {
    key = "ctrl+shift+tab";
    command = "-workbench.action.openPreviousRecentlyUsedEditorInGroup";
  }
  {
    key = "ctrl+shift+tab";
    command = "-workbench.action.quickOpenNavigatePreviousInEditorPicker";
    when = "inEditorsPicker && inQuickOpen";
  }
  {
    key = "ctrl+shift+tab";
    command = "workbench.action.previousEditor";
  }

  {
    key = "ctrl+j";
    command = "editor.action.joinLines";
    when = "editorTextFocus && !editorReadonly";
  }

  {
    key = "ctrl+l";
    command = "editor.action.insertCursorAtEndOfEachLineSelected";
    when = "editorTextFocus";
  }

  {
    key = "shift+alt+i";
    command = "-editor.action.insertCursorAtEndOfEachLineSelected";
    when = "editorTextFocus";
  }

  {
    key = "ctrl+alt+left";
    command = "-workbench.action.moveEditorToPreviousGroup";
  }
  {
    key = "ctrl+alt+left";
    command = "cursorWordPartLeft";
  }

  {
    key = "ctrl+alt+right";
    command = "-workbench.action.moveEditorToNextGroup";
  }
  {
    key = "ctrl+alt+right";
    command = "cursorWordPartRight";
  }

  {
    key = "ctrl+shift+alt+left";
    command = "cursorWordPartLeftSelect";
  }

  {
    key = "ctrl+shift+alt+right";
    command = "cursorWordPartRightSelect";
  }

  {
    key = "ctrl+shift+z";
    command = "-extension.openInZotero";
  }

  {
    key = "ctrl+e";
    command = "-workbench.action.quickOpen";
  }

  {
    key = "ctrl+shift+w";
    command = "-workbench.action.closeWindow";
  }
]
