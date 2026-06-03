{
  description = "AI Final Exam Project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "ai-final-project";

        packages = with pkgs; [
          python3
          uv
          ruff
        ];

        shellHook = ''echo "AI Final Exam Project"'';
      };
    };
}
