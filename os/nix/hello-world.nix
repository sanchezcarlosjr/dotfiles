# nix-build hello-world.nix
# ./result/bin/hello-world
{ stdenv ? (import <nixpkgs> {}).stdenv }:
stdenv.mkDerivation rec {
  pname = "hello-world";
  version = "1.0";
  src = null;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cat > $out/bin/hello-world <<EOF
#!${stdenv.shell}
echo "Hello, world!"
EOF
    chmod +x $out/bin/hello-world
  '';
}

