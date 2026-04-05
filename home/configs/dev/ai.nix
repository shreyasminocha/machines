{
  programs.claude-code = {
    enable = true;
    settings = {
      theme = "dark";
      includeCoAuthoredBy = false;
      promptSuggestionEnabled = false;
      companyAnnouncements = [ ];
      strictKnownMarketplaces = [ ];
      permissions = {
        allow = [ ];
        ask = [ ];
        deny = [
          "Read(./.env)"
          "Read(./.env.*)"
        ];
      };
      env = {
        CLAUDE_CODE_ENABLE_TELEMETRY = "0";
        CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = "1";
        CLAUDE_CODE_ATTRIBUTION_HEADER = "0";
        DISABLE_TELEMETRY = "1";
        DISABLE_ERROR_REPORTING = "1";
        DISABLE_BUG_COMMAND = "1";
        DISABLE_AUTOUPDATER = "1";
      };
      hooks = { };
    };
  };
}
