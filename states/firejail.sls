{% set user = lordcirth %}
{% set firejail_version = 'firejail_0.9.58.2_1_amd64.deb' %}

firejail_pkgs:
  pkg.installed:
    - pkgs:
      - firejail: 'https://sourceforge.net/projects/firejail/files/firejail/{{ firejail_version }}/download'

firejail_firecfg:
  cmd.run
    # Normally 'sudo firecfg' does everything, but we are root
    - name: 'firecfg --add-users {{ user }} --fix'
    - creates: '~{{ user }}/.local/share/applications/firefox.desktop'
