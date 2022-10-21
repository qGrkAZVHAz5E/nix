let pkgs = import <nixpkgs> { };
in pkgs.mkShell {
  name = "pythonEnv";
  buildInputs = with pkgs; [
    # basic python dependencies
    python39
    python39Packages.pandas
    python39Packages.dask
    python39Packages.elasticsearch
  ];
  shellHook = "";
}
