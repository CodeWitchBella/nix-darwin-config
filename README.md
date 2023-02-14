# darwin-nix .config

```
darwin-rebuild switch --flake ~/nix-config
```

## Setup

```
git clone https://github.com/CodeWitchBella/nix-darwin-config.git nix-config
mkdir -p .config
cp -R nix-config/nix .config/
# You also need brew for casks
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

... more stuff needed, but I did no really record everything :-(
