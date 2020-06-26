with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "cv-shell";

  # The packages in the `buildInputs` list will be added to the PATH in our shell
  buildInputs = [
    entr # https://github.com/eradman/entr/
    (texlive.combine { # https://nixos.wiki/wiki/TexLive
      inherit (texlive)
        scheme-medium
        moderncv # https://github.com/xdanaux/moderncv
        changepage # https://www.ctan.org/pkg/changepage
        fontawesome # https://github.com/xdanaux/fontawesome-latex
        tcolorbox # https://www.ctan.org/pkg/tcolorbox
        environ # https://www.ctan.org/pkg/environ
        relsize # https://www.ctan.org/pkg/relsize
        trimspaces # https://www.ctan.org/pkg/trimspaces
        pgfplots # http://pgfplots.sourceforge.net/
        pgfopts; # https://www.ctan.org/pkg/pgfopts
    })
  ];
}
