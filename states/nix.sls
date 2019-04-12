# Install nix in multi-user mode

# TODO: not curl | sh?
nix_script:
  cmd.script:
    - source:   'https://nixos.org/nix/install'
    - creates:  '/nix'
