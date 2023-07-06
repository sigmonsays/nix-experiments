{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.modules.wireguard_client;
  server_ip = "grepped.org";
in {
  options.modules.wireguard_client = {
    enable = mkEnableOption "wireguard client ";
  };

  config = mkIf cfg.enable {

    networking.firewall = {
      allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
    };
    # Enable WireGuard
    networking.wireguard.interfaces = {
      # "wg0" is the network interface name. You can name the interface arbitrarily.
      wg0 = {
        # Determines the IP address and subnet of the client's end of the tunnel interface.
        ips = [ "10.100.0.2/24" ];
        listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

        # Path to the private key file.
        #
        # Note: The private key can also be included inline via the privateKey option,
        # but this makes the private key world-readable; thus, using privateKeyFile is
        # recommended.
        privateKeyFile = /run/keys/wireguard/client/private_key

        peers = [
          # For a client configuration, one peer entry for the server will suffice.

          {
            # Public key of the server (not a file path).
            publicKey = "z8ElXC8kxRaSU1ZTFYjGEOxJsPwuPM8Lchqh68NSqh4=";

            # Forward all the traffic via VPN.
            #allowedIPs = [ "0.0.0.0/0" ];
            # Or forward only particular subnets
            allowedIPs = [ "100.64.0.0/24" ];

            # Set this to the server IP and port.
            endpoint = "${server_ip}:51820";

            # Send keepalives every 25 seconds. Important to keep NAT tables alive.
            persistentKeepalive = 25;
          }
        ];
    };
    };


  };
}
