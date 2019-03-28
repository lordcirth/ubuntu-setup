base:
  '*':
    - cli_pkgs
{% if salt['pkg.info_installed']('xorg', failhard=False ) %}
    - gui_pkgs
{% endif %}

  'virtual:physical':
    - match: grain
    - physical_pkgs


    
