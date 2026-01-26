{
  config,
  pkgs,
  ...
}:
let
  domain = "git.shr.cx";
  local-port = 8040;
  runner-token-secret = "services/forgejo-runner/token";
in
{
  services.caddy.virtualHosts.${domain} = {
    extraConfig = ''
      reverse_proxy :${toString local-port}
    '';
  };

  services.forgejo = {
    enable = true;
    database.type = "postgres";
    lfs.enable = true;
    settings = {
      DEFAULT = {
        APP_NAME = "shreyasn't git";
        APP_SLOGAN = "let him cook";
      };
      server = {
        DOMAIN = domain;
        ROOT_URL = "https://${domain}/";
        HTTP_PORT = local-port;
      };
      repository = {
        DEFAULT_PRIVATE = "private";
        ENABLE_PUSH_CREATE_USER = true;
        DEFAULT_REPO_UNITS = "repo.code";
        DISABLE_STARS = true;
      };
      "repository.upload".ENABLED = false;
      "repository.signing".DEFAULT_TRUST_MODEL = "committer";
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "https://code.forgejo.org/";
      };
      session.COOKIE_SECURE = true;
      service = {
        DISABLE_REGISTRATION = true;
        DEFAULT_KEEP_EMAIL_PRIVATE = true;
        ENABLE_USER_HEATMAP = false;
      };
      admin = {
        DISABLE_REGULAR_ORG_CREATION = true;
      };
      security = {
        INSTALL_LOCK = true;
      };
      other = {
        SHOW_FOOTER_VERSION = false;
        SHOW_FOOTER_TEMPLATE_LOAD_TIME = false;
        SHOW_FOOTER_POWERED_BY = false;
        SHOW_SITEMAP = false;
      };
    };
  };

  services.gitea-actions-runner = {
    package = pkgs.forgejo-runner;
    instances.default = {
      enable = true;
      name = "ortega";
      url = "https://${domain}";
      tokenFile = config.sops.secrets.${runner-token-secret}.path;
      labels = [ "bookworm:docker://node:22-bookworm" ];
    };
  };

  sops.secrets.${runner-token-secret} = { };
}
