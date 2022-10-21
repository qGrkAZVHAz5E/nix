{ config, lib, pkgs, ... }: {
  # Enable virtualisation
  boot.kernelModules = [ "kvm-intel" ];
  virtualisation.libvirtd = {
    enable = true;
    #onBoot = "start";
    onShutdown = "shutdown";
    qemu.package = pkgs.qemu_kvm;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "kirin" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
