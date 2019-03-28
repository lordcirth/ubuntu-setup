# TODO: map.jinja
{% set user = 'lordcirth' %}

# TODO: Not curl | sh. Maybe apt then stack upgrade?
haskell_stack:
  cmd.script:
    - source:   'https://get.haskellstack.org/'
    - creates:  '/usr/local/bin/stack'
