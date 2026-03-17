{ pkgs, ... }:

{    
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";               # Never allow direct root login

      # KexAlgorithms = [
      #   "curve25519-sha256"
      #   "curve25519-sha256@libssh.org"
      #   "diffie-hellman-group16-sha512"
      # ];
      #
      # # MACs (tamper detection)
      # Macs = [
      #   "hmac-sha2-512-etm@openssh.com" # Strong, with encrypt-then-MAC
      #   "hmac-sha2-256-etm@openssh.com" # Backup option
      # ];
      #
      # # Ciphers: Encrypts the data stream. Only use Authenticated Encryption (AEAD).
      # # AES-GCM is fast with hardware acceleration. ChaCha20-Poly1305 is fast in software.
      # Ciphers = [
      #   "chacha20-poly1305@openssh.com"       # Preferred, great performance
      #   "aes256-gcm@openssh.com"               # AES in GCM mode (256-bit)
      #   "aes128-gcm@openssh.com"               # AES in GCM mode (128-bit)
      # ];
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Display Manager 
	services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'uwsm start -S hyprland-uwsm.desktop'";
        user = "greeter";
      };
    };
  };

  services.dbus = {
    enable = true;
    implementation = "broker";
    packages = with pkgs; [
      xfconf
      gnome2.GConf
    ];
  };
}
