sudo nixos-rebuild --flake .\#$1 switch 2>&1 | tee latest.log
