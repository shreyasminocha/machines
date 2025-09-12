_:
let
  editorFontFamily = "'Victor Mono', 'Fira Code', 'Triplicate T4', 'Luxi Mono', 'Hack', monospace, 'Blobmoji'";
  terminalFontFamily = "PowerlineSymbols, 'Fira Code', 'Triplicate T4', 'Luxi Mono', 'Fira Code', 'Hack', monospace";
in
{
  "[astro]" = import ./astro.nix;
  "[c]" = import ./c.nix;
  "[css]" = import ./css.nix;
  "[dart]" = import ./dart.nix;
  "[git-commit]" = import ./git-commit.nix;
  "[go]" = import ./go.nix;
  "[haskell]" = import ./haskell.nix;
  "[html]" = import ./html.nix;
  "[ipynb]" = import ./ipynb.nix;
  "[javascript]" = import ./javascript.nix;
  "[kotlin]" = import ./kotlin.nix;
  "[latex]" = import ./latex.nix;
  "[literate haskell]" = import ./literate-hs.nix;
  "[markdown]" = import ./markdown.nix;
  "[mdx]" = import ./mdx.nix;
  "[pgn]" = import ./pgn.nix;
  "[plaintext]" = import ./plaintext.nix;
  "[python]" = import ./python.nix;
  "[rust]" = import ./rust.nix;
  "[todo]" = import ./todo.nix;
  "[typescript]" = import ./typescript.nix;
  "[typescriptreact]" = import ./typescriptreact.nix;
  "[typst-code]" = import ./typst-code.nix;
  "[typst]" = import ./typst.nix;
  "[yaml]" = import ./yaml.nix;

  "breadcrumbs.filePath" = "off";
  "debug.onTaskErrors" = "abort";
  "diffEditor.renderSideBySide" = false;
  "diffEditor.ignoreTrimWhitespace" = false;
  "editor.acceptSuggestionOnCommitCharacter" = false;
  "editor.acceptSuggestionOnEnter" = "off";
  "editor.cursorStyle" = "line";
  "editor.dragAndDrop" = false;
  "editor.fontFamily" = editorFontFamily;
  "editor.fontLigatures" = "'ss03', 'ss02'";
  "editor.hideCursorInOverviewRuler" = true;
  "editor.minimap.maxColumn" = 100;
  "editor.multiCursorModifier" = "ctrlCmd";
  "editor.quickSuggestions" = {
    other = true;
    comments = false;
    strings = false;
  };
  "editor.rulers" = [
    80
  ];
  "editor.smoothScrolling" = true;
  "editor.tabCompletion" = "onlySnippets";
  "editor.wordWrap" = "bounded";
  "editor.wordWrapColumn" = 100;
  "editor.guides.indentation" = false;
  "editor.bracketPairColorization.enabled" = false;
  "editor.indentSize" = "tabSize";
  "editor.scrollBeyondLastLine" = false;
  "editor.foldingStrategy" = "auto";
  "editor.insertSpaces" = false;
  "editor.stickyTabStops" = true;
  "editor.inlineSuggest.enabled" = true;
  "editor.fontSize" = 13;
  "editor.minimap.renderCharacters" = false;
  "editor.minimap.showSlider" = "always";
  "editor.minimap.autohide" = "mouseover";
  "editor.wordSeparators" = "`~!@#$%^&*()-=+[{]}\\|;:'\",.<>/?—";
  "editor.semanticHighlighting.enabled" = true;
  "editor.formatOnSave" = true;
  "editor.linkedEditing" = true;
  "editor.tokenColorCustomizations" = {
    "[Catppuccin Macchiato]" = {
      comments = "#bbb";
    };
    "[Material Theme Ocean High Contrast]" = {
      comments = "#aaa";
      textMateRules = [
        {
          scope = "punctuation.definition.comment.java";
          settings = {
            foreground = "#aaa";
          };
        }
      ];
    };
    "[Community Material Theme High Contrast]" = {
      comments = "#aaa";
      textMateRules = [
        {
          scope = "string.quoted.docstring";
          settings = {
            foreground = "#aaa";
          };
        }
        {
          scope = "comment.block.coq";
          settings = {
            foreground = "#ddd";
            fontStyle = "";
          };
        }
      ];
      settings = {
        foreground = "#0000005e";
      };
    };
    "[Material Theme High Contrast]" = {
      comments = "#aaa";
      textMateRules = [
        {
          scope = "string.quoted.docstring";
          settings = {
            foreground = "#aaa";
          };
        }
        {
          scope = "comment.block.coq";
          settings = {
            foreground = "#ddd";
            fontStyle = "";
          };
        }
        {
          scope = "string.other.link.destination.mdx";
          settings = {
            foreground = "#F07178";
          };
        }
        {
          scope = "string.other.begin.link.mdx";
          settings = {
            foreground = "#89DDFF";
          };
        }
        {
          scope = "string.other.end.mdx";
          settings = {
            foreground = "#89DDFF";
          };
        }
        {
          scope = "string.other.begin.mdx";
          settings = {
            foreground = "#89DDFF";
          };
        }
        {
          scope = "string.other.begin.yaml";
          settings = {
            foreground = "#EEFFFF";
          };
        }
        {
          scope = "string.other.end.yaml";
          settings = {
            foreground = "#EEFFFF";
          };
        }
      ];
    };
  };
  "explorer.autoReveal" = false;
  "explorer.confirmDelete" = false;
  "explorer.confirmDragAndDrop" = false;
  "explorer.compactFolders" = false;
  "explorer.openEditors.visible" = 0;
  "explorer.fileNesting.patterns" = {
    "*.ts" = "$\{capture\}.js";
    "*.js" = "$\{capture\}.js.map, $\{capture\}.min.js, $\{capture\}.d.ts";
    "*.jsx" = "$\{capture\}.js";
    "*.tsx" = "$\{capture\}.ts";
    "tsconfig.json" = "tsconfig.*.json";
    "package.json" = "package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lockb";
    "Cargo.toml" = "Cargo.lock";
    "*.sqlite" = "$\{capture\}.$\{extname\}-*";
    "*.db" = "$\{capture\}.$\{extname\}-*";
    "*.sqlite3" = "$\{capture\}.$\{extname\}-*";
    "*.db3" = "$\{capture\}.$\{extname\}-*";
    "*.sdb" = "$\{capture\}.$\{extname\}-*";
    "*.s3db" = "$\{capture\}.$\{extname\}-*";
  };
  "extensions.autoUpdate" = false;
  "extensions.ignoreRecommendations" = true;
  "files.associations" = {
    "*.sublime-project" = "json";
    "*.sublime-workspace" = "json";
    "*.nrv" = "javascript";
    ".stylelintrc" = "yaml";
    "*.terminal" = "xml";
    Vagrantfile = "properties";
    ".eslintrc" = "yaml";
    ".zshrc" = "shellscript";
    zshrc = "shellscript";
    "shreyasminocha.me" = "NGINX";
    "*.shreyasminocha.me" = "NGINX";
    "mozilla.cfg" = "javascript";
    "librewolf.cfg" = "javascript";
    applypatch-msg = "shellscript";
    fsmonitor-watchman = "shellscript";
    p4-pre-submit = "shellscript";
    post-applypatch = "shellscript";
    post-checkout = "shellscript";
    post-commit = "shellscript";
    post-merge = "shellscript";
    post-receive = "shellscript";
    post-rewrite = "shellscript";
    post-update = "shellscript";
    pre-applypatch = "shellscript";
    pre-auto-gc = "shellscript";
    pre-commit = "shellscript";
    pre-push = "shellscript";
    pre-rebase = "shellscript";
    pre-receive = "shellscript";
    prepare-commit-msg = "shellscript";
    push-to-checkout = "shellscript";
    rebase = "shellscript";
    sendemail-validate = "shellscript";
    update = "shellscript";
    "*.sublime-theme" = "jsonc";
    ".gitignore" = "git-commit";
    "*.njk" = "html";
    "pubspec.lock" = "yaml";
    "*.tmpl" = "html";
    "*.po" = "ini";
    "*.pot" = "ini";
    "yarn.lock" = "yaml";
    ".git_profiles" = "properties";
    ".alexrc" = "yaml";
    "*.itermcolors" = "xml";
    ".env.*" = "dotenv";
    "*.YAML-tmLanguage" = "yaml";
    "*.sublime-syntax" = "yaml";
    "*.py3" = "python";
    "*.lyx" = "latex";
    "*.lyx~" = "latex";
    "go.mod" = "go";
    hosts = "hosts";
    ".todo" = "markdown";
    "*.txt" = "plaintext";
    exclude = "ignore";
    "*.desktop" = "ini";
    "*.css" = "css";
    ".clang-format" = "yaml";
    TRACE = "log";
    README = "markdown";
    "*.hyleak" = "c";
    "*.ipynb" = "ipynb";
    "flake.lock" = "json";
  };
  "files.defaultLanguage" = "en";
  "files.exclude" = {
    "**/__pycache__" = true;
    "**/.classpath" = true;
    "**/.DS_Store" = true;
    "**/.factorypath" = true;
    "**/.git" = true;
    "**/.hg" = true;
    "**/.ipynb_checkpoints" = true;
    "**/.project" = true;
    "**/.settings" = true;
    "**/.svn" = true;
    "**/*.aux" = true;
    "**/*.fdb_latexmk" = true;
    "**/*.fls" = true;
    "**/*.hi" = true;
    "**/*.o" = true;
    "**/*.sage.py" = true;
    "**/*.synctex.gz" = true;
    "**/CVS" = true;
    "**/node_modules" = true;
  };
  "files.trimFinalNewlines" = true;
  "files.insertFinalNewline" = true;
  "files.trimTrailingWhitespace" = true;
  "security.workspace.trust.untrustedFiles" = "open";
  "telemetry.telemetryLevel" = "off";
  "terminal.integrated.fontFamily" = terminalFontFamily;
  "terminal.external.linuxExec" = "konsole";
  "terminal.integrated.cursorStyle" = "line";
  "terminal.external.osxExec" = "Hyper.app";
  "terminal.integrated.tabs.enabled" = true;
  "terminal.integrated.commandsToSkipShell" = [
    "github.copilot.terminal.suggestCommand"
    "language-julia.interrupt"
  ];
  "update.mode" = "none";
  "window.newWindowDimensions" = "maximized";
  "window.titleBarStyle" = "native";
  "window.commandCenter" = false;
  "window.restoreWindows" = "none";
  "workbench.commandPalette.history" = 15;
  "workbench.iconTheme" = "material-icon-theme";
  "workbench.list.multiSelectModifier" = "alt";
  "workbench.startupEditor" = "none";
  "workbench.tips.enabled" = false;
  "workbench.tree.renderIndentGuides" = "none";
  "workbench.settings.enableNaturalLanguageSearch" = false;
  "workbench.enableExperiments" = false;
  "workbench.productIconTheme" = "material-product-icons";
  "workbench.colorCustomizations" = {
  };
  "workbench.editor.untitled.labelFormat" = "name";
  "workbench.editorAssociations" = {
    "*.o" = "hexEditor.hexedit";
    "*.class" = "hexEditor.hexedit";
    "{hexdiff}:/**/*.*" = "hexEditor.hexedit";
    "*.db" = "sqlite-viewer.option";
    "*.pdf" = "latex-workshop-pdf-hook";
  };
  "workbench.editor.decorations.badges" = false;
  "workbench.editor.empty.hint" = "hidden";
  "workbench.colorTheme" = "Catppuccin Mocha";
  "workbench.commandPalette.experimental.enableNaturalLanguageSearch" = false;
  "workbench.layoutControl.enabled" = false;
}
