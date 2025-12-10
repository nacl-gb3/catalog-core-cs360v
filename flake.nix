{
  description = "A basic flake with a shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pkgsArm = import nixpkgs {
          localSystem = "${system}";
          crossSystem = {
            config = "aarch64-linux-gnu";
          };
        };
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.gcc
            # pkgs.clang
            pkgs.gdb
            # pkgs.valgrind
            pkgs.gnumake
            # pkgs.cmake
            # pkgs.bear
            pkgs.pkg-config
            pkgs.ncurses
            pkgs.flex
            pkgs.bison
            pkgs.libuuid
            pkgs.libarchive
            (pkgs.python3.withPackages (python-pkgs: [ ]))
          ];
          buildInputs = [
            pkgs.ncurses
          ];
        };
        devShells.arm = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.gcc
            pkgs.gnumake

            pkgsArm.gcc
            pkgsArm.gdb
            pkgsArm.gnumake
            pkgsArm.flex
            pkgsArm.bison
            pkgsArm.libuuid
            pkgsArm.libarchive
            (pkgsArm.python3.withPackages (python-pkgs: [ ]))
          ];
          buildInputs = [
            pkgsArm.ncurses
          ];
        };
      }
    );
}
