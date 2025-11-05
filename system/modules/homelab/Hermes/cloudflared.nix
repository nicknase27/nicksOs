{...}: {
  services.cloudflared = {
    enable = true;
    tunnels."911ae7cf-2eaf-400b-a6c2-35f79b7ffea5" = {
      credentialsFile = "/var/lib/cloudflared/911ae7cf-2eaf-400b-a6c2-35f79b7ffea5.json";
      certificateFile = "/var/lib/cloudflared/cert.pem";
      default = "http_status:404";
    };
  };
}
