/*       .             .'|.                   ..|''||    .|'''.|
 ....  .||.    ....  .||.    ....   .. ...   .|'    ||   ||..  '
||. '   ||   .|...||  ||    '' .||   ||  ||  ||      ||   ''|||.
. '|..  ||   ||       ||    .|' ||   ||  ||  '|.     || .     '||
|'..|'  '|.'  '|...' .||.   '|..'|' .||. ||.  ''|...|'  |'....|'
stefanOS v0.0 Howling Hyrax 2025-10-25

This is your USER level nix config
It should be present at `~/nix-config/users/stefan.nix`
*/

{ config, pkgs, lib, ... }:

{

  programs.firefox.enable = true;

  #-- SHELL --#
  /* Your shell is your Command Line Interface you use on your terminal emulator */
  programs.zsh = {  # `zsh` is the modern standard that replaced `bash`
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {  # `oh-my-zsh` is a plugin engine for `zsh`
      enable = true;
      plugins = [ "git" "sudo" "command-not-found" ];
      theme = "powerlevel10k/powerlevel10k";
      custom = "$HOME/.oh-my-zsh/custom";
    };

  #-- SHELL ALIASES --#
  /* aliases are used to refer to preset inputs so  */
  /* you don't have to remember all this bullshit   */
    shellAliases = {
      /* you will have to figure out the name of your audio devices with the command `catnip ld` */
      #catnipc = "catnip -d alsa_output.usb-Corsair_Corsair_HS55_SURROUND-00.analog-stereo";
      #catnips = "catnip -d alsa_output.pci-0000_0c_00.6.analog-stereo";
      /* these are for software dimming your screen brightness  */
      /* you can see your device names with the command         */
      /* `xrandr --current`                                     */
      #dimmon = "xrandr --output HDMI-0 --brightness";
      #dimtv = "xrandr --output DP-1 --brightness";
      hmb = "home-manager build --flake ~/nix-config#hyperhyrax";
      hme = "nvim ~/nix-config/users/stefan.nix";
      hms = "sudo nixos-rebuild switch --flake ~/nix-config#hyperhyrax";
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      lsda = "lsd -lha";
      lsdt = "lsd --tree -d";
      makemine = "sudo chown -R $USER:$(id -gn)";
      #mpvcrt = "mpv --profile=crt-guest-advanced-ntsc";
      ncg = "nix-collect-garbage -d"; # run this to cleanup disk space in `/nix/store` (not important)
      ni = "nix-env -iA nixpkgs";
      nl = "nix-env -q";
      nr = "nix run nixpkgs#";
      ns = "nix search nixpkgs"; # https://search.nixos.org/packages
      nsgc = "nix store gc";
      nshell = "nix shell";
      /* use `nshellp packagename` to load a temporary environment  */
      /* where you can run a program without installing it on       */
      nshellp = "nix-shell -p --extra-experimental-features flakes";
      nsize = "nix path-info -Sh /nix/store/*";
      nu = "nix-env -e";
      p = "python3";
      /* this is going to be your main command for updating your system software                */
      /* and more broadly rebuild it from whats declared in the user (this) and system config   */
      rebuild = "sudo nixos-rebuild switch --flake ~/nix-config#hyperhyrax";
      shellklok = "python3 ~/scripts/shellklok.py";
    };

    /* disables powerlevel10k auto-configuration wizard             */
    /* there's probably a better way of doing this but mine works   */
    initContent = ''
      typeset -g POWERLEVEL9K_CONFIG_FILE="$HOME/.p10k.zsh";
      [[ -f $POWERLEVEL9K_CONFIG_FILE ]] && source $POWERLEVEL9K_CONFIG_FILE;
      typeset -g POWERLEVEL9K_INSTANT_PROMPT=off;
    '';
  };

  #-- USER CONFIG --#
  home = {
    username = "stefan";
    homeDirectory = "/home/stefan";
    stateVersion = "25.05";

    #-- ENVIRONMENTAL VARIABLES --#
    sessionVariables = {
      EDITOR = "nano"; # default terminal text editor
    };
    sessionPath = [ "$HOME/.local/bin" ];

    #-- USER PACKAGES --#
    /* user level software */
    packages = with pkgs; [
      networkmanager
      zsh zsh-powerlevel10k   # your shell and the themer
      cool-retro-term         # cool retro terminal
      qdirstat                # data usage visualizer
      _7zz-rar unrar          # file compression
      qbittorrent             # le bittorrent client
      #mullvad-vpn             # mullvad vpn client

      #--- MEDIA ---#
      gimp imagemagick        # image manipulation
      mpv vlc                 # media players
      feh geeqie              # image viewers
      obs-studio              # streaming/recording

      #--- WEB ---#
      chawan                  # web browser for your terminal
      firefox                 # based browser by cringe mozilla
      ladybird                # ultra based but immature new browser https://ladybird.org/
      tor-browser-bundle-bin

      #--- GAME ---#
      retroarchFull           # emulation suite, it's own whole thing https://www.retroarch.com/
      steam protonup-qt       # steam and some stuff for linux optimization
      rebels-in-the-sky       # spacepirate basketball team manager game for your terminal ;-)

      #--- TERMINAL ---#
      /* Text User Interface programs */
      neovim vim nano         # text editors
      mc nnn yazi             # file managers, recommend yazi
      tealdeer                # `tldr` command info/help app, THIS IS GOATED
      ripgrep fd fzf          # finder utilities
      wikit                   # wikipedia
      bk                      # ebook reader *.epub format
      amfora                  # gemini browser (alt internet)
      catnip                  # audio visualizer
      gpg-tui gnupg1          # PGP/gpg encryption
      kew                     # music player
      asciiquarium-transparent# fishtank screensaver
      btop-cuda htop nvtopPackages.nvidia   # resource monitors (assuming NVIDIA GPU)
      bat lsd fastfetch figlet termdown tree rsync zoxide   # useful utilities/tools yew shuld use
      yt-dlp                  # youtube downloader utility, THIS IS GOATED
      tmux                    # terminal multiplexer

      #--- OFFICE ---#
      libreoffice-qt6         # think microsoft office suite but free

      #--- CRYPTO ---#
      #monero-gui monero-cli   # XMR wallet

      #--- DEV ---#
      /* ayo don worry about dis stuff ok? */
      git gcc gnumake cmake pkg-config
      python3Full python3Packages.pip
      home-manager

      #--- CONTAINERS/VIRTUALIZATION ---#
      /* this stuff is cool, but advanced and unnecessary, so it's here if you need it */
      #docker      # its own whole fucking thing https://wiki.nixos.org/wiki/Docker/en
      #virtualbox  # legacy vm
      #qemu_full   # modern vm
      #quickemu    # qemu wrapper

      #virtualisation.docker = {
      #  enable = true;
      #};

      #--- HOMESERVER ---#
      /* home servers are for self-hosted services  */
      /* https://igwiki.lyci.de/wiki/Home_server    */
      #jellyfin jellyfin-web jellyfin-ffmpeg    # jellyfin is a netflix like media server

      #--- KDE ---#
      /* i put all the KDE packages together */
      kdePackages.ark kdePackages.dolphin kdePackages.kate kdePackages.konsole kdePackages.partitionmanager kdePackages.zanshin

      #--- dumb shit ---#
     # oneko                   # virtual pet (needs x11)
    ];
  };

  # Disable rio to avoid mdDoc errors
  programs.rio.enable = false;
}
