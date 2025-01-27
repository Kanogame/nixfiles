{ pkgs, ... }: {
  programs.zsh.enable = true;

  home-manager.users.kano = { pkgs, ... }: {

    home.packages = with pkgs; [
      alacritty
      killall
      direnv
    ];

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    programs.zsh = {
      enable = true;

      # directory to put config files in
      dotDir = ".config/zsh";

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      # .zshrc
      initExtra = ''
        PROMPT="%F{blue}%m %~%b "$'\n'"%(?.%F{green}%Bλ%b |.%F{red}?) %f"

        #export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store";
        #export ZK_NOTEBOOK_DIR="~/stuff/notes";
        export DIRENV_LOG_FORMAT="";
        bindkey '^ ' autosuggest-accept
      '';

      # `cd ~dots` will cd into ~/.dots
      dirHashes = {
        dots = "$HOME/.dots";
        prog = "$HOME/prog";
        notes = "$HOME/notes";
      };

      # Tweak settings for history
      history = {
        save = 1000;
        size = 1000;
        path = "$HOME/.cache/zsh_history";
      };

      # Set some aliases
      shellAliases = {
        c = "clear";
        mkdira = "mkdir -vp";
        rma = "rm -rifv";
        mva = "mv -iv";
        cpa = "cp -riv";
        nd = "nix develop -c $SHELL";
      };

	zplug = {
    		enable = false;
    		plugins = [ 
			{name = "zsh-users/zsh-history-substring-search"; tags = [as:plugin];}
		];
  	};

    };
  };
  users.users.kano.shell = pkgs.zsh;

}
