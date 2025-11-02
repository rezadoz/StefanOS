<img width="970" height="133" alt="image" src="https://github.com/user-attachments/assets/0e013629-e47d-4f88-92a4-ff516e50e6aa" />

---

<img width="963" height="81" alt="image" src="https://github.com/user-attachments/assets/5d75d279-ba8b-4dfe-921a-aadaa08e88fe" />

my nix for friends (formerly: benix)

### Installation:
1. install nixOS
2. run the following commands in your terminal
```bash
cd ~
git clone https://github.com/rezadoz/stefanOS.git temp
mv temp/.git .
mv temp/* .
mv temp/.* . 2>/dev/null
rm -rf temp
sudo nixos-rebuild switch --flake ~/nix-config#hyperhyrax
```

### Structure:

```
/home/stefan/
├──.p10k.zsh
└──nix-config/
   ├──flake.nix
   ├──hosts/
   │   └──howlinghyrax.nix
   └──users/
       └──stefan.nix
```

### Included Software:

```nix
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
      rebels-in-the-sky       # spacepirate basketball team manager game for your terminal
      superTuxKart            # kart racing

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
      asciiquarium-transparent              # fishtank screensaver
      btop-cuda htop nvtopPackages.nvidia   # resource monitors (assuming NVIDIA GPU)
      bat                     # view the text content of a file
      lsd                     # list contents of current dir plus more `tldr lsd`
      fastfetch               # fetch utility
      figlet                  # ascii art text generator `tldr figlet`
      termdown                # timer/stopwatch `tldr termdown`
      tree                    # list dir contents in a tree view
      rsync                   # powerful file transfer/backup utility `tldr rysnc`
      yt-dlp                  # youtube downloader utility, THIS IS GOATED
      tmux                    # terminal multiplexer https://tmuxcheatsheet.com/

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
      #virtualbox  # legacy vm https://nixos.wiki/wiki/VirtualBox
      #qemu_full   # modern vm https://nixos.wiki/wiki/QEMU
      #quickemu    # qemu wrapper to quickly create virtual machines https://github.com/quickemu-project/quickemu

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

      #--- X11 only ---#
      /* the following software only works on x11 (not Wayland) */
      oneko                   # virtual pet (needs x11)
      xscreensaver            # screensavers, run `xscreensaver-settings` in terminal
```
