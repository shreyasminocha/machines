{
  programs.numbat = {
    enable = true;
    settings = {
      intro-banner = "short";
      prompt = ">>> ";
      pretty-print = "auto";
      exchange-rates.fetching-policy = "on-startup";
    };
  };
}
