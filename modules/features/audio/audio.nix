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
      pwvucontrol
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
        wireplumber.enable = true;
        extraConfig.pipewire = {
          adjust-sample-rate = {
            "context.properties" = {
              "default.clock.allowed-rates" = [
                44100
                48000
                88200
                96000
                176400
                192000
              ];
              "default.clock.rate" = 192000;
            };
          };
          noresample = {
            "context.properties" = {
              "defauT.clock.allowed-rates" = [
                44100 48000 96000 192000
              ];
              "default.clock.rate" = 192000;
            };
          };
        };
      };
    };
  };
}
