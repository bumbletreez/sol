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
      kernel.realtime = true;
      rtcqs.enable = true;
      alsaSeq.enable = false;
      rtirq = {
        resetAll = 1;
        prioLow = 0;
        enable = true;
        nameList = "rtc0 snd";
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
              ];
              "default.clock.rate" = 96000;
            };
          };
          noresample = {
            "context.properties" = {
              "defauT.clock.allowed-rates" = [
                44100 48000 96000 
              ];
              "default.clock.rate" = 96000;
            };
          };
        };
      };
    };
  };
}
