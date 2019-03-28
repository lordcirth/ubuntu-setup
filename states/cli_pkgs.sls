apt_upgrade:
  pkg.uptodate
    - refresh: True

# TODO: LTS only?
hwe_kernel:
  pkg.installed:
    - pkgs:
      - linux-image-generic-hwe-18.04

apt_cli_pkgs:
  pkg.installed:
    - pkgs:
      - p7zip-full
      - apt-file
      - buffer
      - build-essential
      - curl
      - dtrx
      - git
      - gdebi
      - glances
      - htop
      - jq
      - moreutils
      - ncdu
      - neovim
      - nmap
      - pastebinit
      - python-pip
      - python3-pip
      - pv
      - tasksh
      - tmux
      - tree
      - wget
