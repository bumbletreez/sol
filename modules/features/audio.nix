{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.audio = {
    pkgs,
    ...
  }:{
    imports = [
      inputs.musnix.nixosModules.musnix
    ];
    musnix = {
      enable = true;
      rtcqs.enable = true;
      kernel.packages = pkgs.linuxPackages_latest;
      kernel.realtime = true;
      rtirq = {
        enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
      reaper
      reaper-reapack-extension
      reaper-sws-extension 
      neural-amp-modeler-lv2
      cardinal
      surge-xt
      openutau
      ffmpeg-full
      yabridge
      yabridgectl
      winePackages.yabridge
      odin2
      dexed
      vital
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
      flatpak.packages = [
        { appId = "com.usebottles.bottles"; origin = "flathub"; }
      ];
    };
    
    fonts.packages = with pkgs; [
      fira-sans
      roboto
    ];
  };
}
