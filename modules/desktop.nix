{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		wezterm
		syncthing
		mpv
		keepassxc
		obsidian
	];
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"obsidian"
	];
}

