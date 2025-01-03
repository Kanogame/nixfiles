{
  home-manager.users.kano = { pkgs, ... }: {
    programs.firefox = {
      enable = true;
      policies = {
        settings = {
          "webgl.disabled" = false;
          "privacy.clearOnShutdown.history" = false;
          "privacy.clearOnShutdown.cookies" = false;
          "network.cookie.lifetimePolicy" = 0;
        };
        ExtensionSettings = with builtins;
          let
            extension = shortId: uuid: {
              name = uuid;
              value = {
                install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                installation_mode = "normal_installed";
              };
            };
          in
          listToAttrs [
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
            (extension "noscript" "{73a6fe31-595d-460b-a920-fcc0f8843232}")
            (extension "10ten-ja-reader" "{59812185-ea92-4cca-8ab7-cfcacee81281}")
            (extension "user-agent-string-switcher" "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}")
            (extension "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
          ];
      };
    };
  };
}
