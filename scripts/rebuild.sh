pushd ~/.dots/nixos
echo "Git Diff"
git diff
echo "Building NixOS"
sudo nixos-rebuild switch | tee latest.log
gen=$(nixos-rebuild list-generations | grep current)
echo "Commiting $gen"
git commit -am "$gen"
echo "done!"
popd
