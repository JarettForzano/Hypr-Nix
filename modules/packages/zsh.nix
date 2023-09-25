{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    # .zshrc
    initExtra = ''
      export INPUT_METHOD=fcit
      export QT_IM_MODULE=fcitx
      export GTK_IM_MODULE=fcitx
      export XMODIFIERS=@im=fcitx
      export XIM_SERVERS=fcitx

      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
# picks where to store the files for zsh
    dirHashes = { dots = "$HOME/.config/home-manager"; };

    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.cache/zsh_history";
    };

    shellAliases = {
      c = "clear";
      mkdir = "mkdir -vp";
      rm = "rm -rifv";
      mv = "mv -iv";
      cp = "cp -riv";
      cat = "bat --paging=never --style=plain";
      ls = "eza -a --icons";
      tree = "eza --tree --icons";
      lla = "ls -la";
      g = "git";
      v = "nvim";
      vim = "nvim";
      rebuild = "home-manager switch --flake $HOME/.config/home-manager#jarett";
      nixos-rebuild = "sudo nixos-rebuild switch --flake $HOME/.config/home-manager#laptop";

      slack = "firefox -new-window https://app.slack.com/client/T05PGHE2AUE/C05QT0NC1L6";
    };

  };
}
