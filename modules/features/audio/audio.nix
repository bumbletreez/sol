{
  self,
  inputs,
  ...
}: {
  flake-file.inputs = {
    musnix.url = "github:musnix/musnix";
  };

  flake.modules.nixos.audio = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.musnix.nixosModules.musnix
    ];

    musnix = {
      enable = true;
      rtcqs.enable = true;
      rtirq = {
        enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      ffmpeg-full
    ];

    security.rtkit.enable = true;

    services = {
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
    };
  };
}
