{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    plugins = with pkgs.yaziPlugins; {
      inherit
        yatline
        yatline-catppuccin
        toggle-pane
        git
        mediainfo
        ouch
        glow
        ;
    };
    settings = {
      mgr = {
        ratio = [
          0
          3
          5
        ];
        show_hidden = true;
      };
      plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }

        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
    };
    initLua = ''
      require("git"):setup()

      local catppuccin_theme = require("yatline-catppuccin"):setup("mocha")

      require("yatline"):setup({
        theme = catppuccin_theme,
      	show_background = true,

      	header_line = {
      		left = {
      			section_a = { },
      			section_b = { },
      			section_c = { }
      		},
      		right = {
      			section_a = { },
      			section_b = { },
      			section_c = { }
      		}
      	},
      	status_line = {
      		left = {
      			section_a = { {type = "string", custom = false, name = "tab_mode"}, },
      			section_b = { {type = "string", custom = false, name = "hovered_size"}, },
      			section_c = { {type = "string", custom = false, name = "hovered_name"}, }
      		},
      		right = {
      			section_a = { {type = "string", custom = false, name = "cursor_position"}, },
      			section_b = { {type = "string", custom = false, name = "cursor_percentage"}, },
      			section_c = { {type = "coloreds", custom = false, name = "permissions"}, }
      		}
      	},
      })
    '';
  };
  catppuccin.yazi.enable = true;
}
