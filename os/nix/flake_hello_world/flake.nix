{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.my_hello = nixpkgs.legacyPackages.x86_64-linux.hello.overrideAttrs (oldAttrs: rec {
      pname = "my_hello_world";  # Override the package name here.
      version = "1.0";           # Optionally, override the version.
    });

    # Optionally, make this the default package output.
    packages.x86_64-linux.default = self.packages.x86_64-linux.my_hello;
  };

}

