nextcloud_client_repo:
  pkgrepo.managed:
    - ppa: 'ppa:nextcloud-devs/client'


gui_pkgs:
  pkg.installed:
    - pkgs:
      - hexchat
      - keepassxc
      - nextcloud-client
      - tilda
      - vlc
    - require:
      - pkgrepo: nextcloud_client_repo
