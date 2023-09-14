{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    # .zshrc
    initExtra = ''
      export DIRENV_LOG_FORMAT="";
      export LIBSEAT_BACKEND=logind;

      export INPUT_METHOD=fcitx
      export QT_IM_MODULE=fcitx
      export GTK_IM_MODULE=fcitx
      export XMODIFIERS=@im=fcitx
      export XIM_SERVERS=fcitx

      bindkey '^ ' autosuggest-accept
      edir() { tar -cz $1 | age -p > $1.tar.gz.age && rm -rf $1 &>/dev/null && echo "$1 encrypted" }
      ddir() { age -d $1 | tar -xz && rm -rf $1 &>/dev/null && echo "$1 decrypted" }

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
      exa = "eza";
      rebuild = "home-manager switch --flake $HOME/.config/home-manager#jarett";
      rebuild_config =
        "sudo nixos-rebuild switch --flake $HOME/.config/home-manager#laptop";
    };

    # Source all plugins, nix-style
    plugins = [ ];
  };
}
