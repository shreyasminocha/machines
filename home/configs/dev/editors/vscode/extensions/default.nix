{
  pkgs,
  lib,
  vscode,
  ...
}:
let
  inherit (pkgs.forVSCodeVersion vscode.version) vscode-marketplace;

  files = [
    # ./copilot.nix
    # ./cpp.nix
    ./cspell.nix
    ./css.nix
    ./emmet.nix
    ./git.nix
    # ./gitlens.nix
    ./go.nix
    # ./grammarly.nix
    # ./harper.nix
    # ./haskell.nix
    ./html.nix
    ./java.nix
    ./javascript.nix
    ./json.nix
    ./jupyter.nix
    # ./kotlin.nix
    ./latex-workshop.nix
    ./latex.nix
    # ./lilypond.nix
    # ./ltex.nix
    ./markdown.nix
    ./markdownlint.nix
    ./material-icon-theme.nix
    # ./mypy.nix
    ./nix.nix
    ./prettier.nix
    ./python.nix
    # ./rewrap.nix
    ./ruff.nix
    ./rust-analyzer.nix
    # ./svelte.nix
    ./typst.nix
    # ./todo-tree.nix
    ./todo.nix
    ./ty.nix
    ./typescript.nix
  ];
  otherExtensions = map (file: import file { inherit pkgs lib vscode-marketplace; }) files;
in
{
  extensions =
    builtins.concatLists (map (x: x.extensions) otherExtensions)
    ++ (with vscode-marketplace; [
      # catppuccin.catppuccin-vsc
      # ahmadawais.shades-of-purple
      arcticicestudio.nord-visual-studio-code
      # equinusocio.vsc-community-material-theme

      arrterian.nix-env-selector

      pkief.material-product-icons

      jkjustjoshing.vscode-text-pastry
      mohammadbaqer.better-folding
      ms-vscode.hexeditor

      # ms-vscode.wordcount

      skellock.just
      tamasfe.even-better-toml
      sclu1034.justfile
      mikestead.dotenv
      mechatroner.rainbow-csv

      # vscode.smali
      # w-wterdan.smali
      loyieking.smalise
      astro-build.astro-vscode
      # bradlc.vscode-tailwindcss
      # oven.bun-vscode

      # ocamllabs.ocaml-platform

      # a5huynh.vscode-ron
      # adelphes.android-dev-ext
      # adguard.adblock
      # arwinneil.lolcode
      # asvetliakov.vscode-neovim
      # basdp.language-gas
      # bmalehorn.vscode-fish
      # bmewburn.vscode-intelephense-client
      # csstools.postcss
      # denoland.vscode-deno
      # eww-yuck.yuck
      # fireblast.hyprlang-vscode
      # ginfuru.better-nunjucks
      # github.codespaces
      # github.copilot-chat
      # github.vscode-pull-request-github
      # graphql.vscode-graphql
      # graphql.vscode-graphql-syntax
      # hangxingliu.vscode-nginx-conf-hint
      # jakebecker.elixir-ls
      # janisdd.vscode-edit-csv
      # jeandeaual.scheme
      # joaompinto.vscode-graphviz
      # jpotterm.simple-vim
      # juanblanco.solidity
      # kale-lab.salt
      # llvm-vs-code-extensions.vscode-clangd
      # lov3.sagemath-enhanced
      # mammothb.gnuplot
      # marp-team.marp-vscode
      # matthewpi.caddyfile-support
      # maximedenes.vscoq
      # ms-vscode-remote.remote-ssh
      # ms-vscode-remote.remote-ssh-edit
      # ms-vscode.cmake-tools
      # ms-vscode.remote-explorer
      # ms-vscode.vscode-serial-monitor
      # ms-vsliveshare.vsliveshare
      # mshr-h.veriloghdl
      # ocamllabs.ocaml-platform
      # phoenixframework.phoenix
      # qingpeng.common-lisp
      # qwtel.sqlite-viewer
      # rebornix.scheme
      # redhat.java
      # reditorsupport.r
      # reditorsupport.r-syntax
      # rust-lang.rust-analyzer
      # sebastianhiggins.vscode-gemtext
      # shaunlebron.vscode-parinfer
      # shigma.vscode-wl
      # surendrajat.apklab
      # takumii.markdowntable
      # thenuprojectcontributors.vscode-nushell-lang
      # tintinweb.graphviz-interactive-preview
      # tommasov.hosts
      # tomoyukim.vscode-mermaid-editor
      # tonybaloney.vscode-pets
      # twxs.cmake
      # unifiedjs.vscode-mdx
      # vadimcn.vscode-lldb
      # vsciot-vscode.vscode-arduino
      # vscjava.vscode-gradle
      # vscode-org-mode.org-mode
      # wolframresearch.wolfram
      # yinfei.luahelper
      # ziglang.vscode-zig
      # zxh404.vscode-proto3
    ]);
  settings = builtins.foldl' (acc: x: acc // x.settings) { } otherExtensions;
}
