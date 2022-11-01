with (import (fetchTarball https://github.com/nixos/nixpkgs/archive/nixpkgs-unstable.tar.gz) {});

mkShell {
  buildInputs = [
    tectonic
    twemoji-color-font
    entr # https://github.com/eradman/entr/
  ];
}
