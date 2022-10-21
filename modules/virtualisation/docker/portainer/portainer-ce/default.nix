# Anything that doesn't have a specific option designated for it can be thrown into
# extraOptions in the same way you would run a command line docker command
# Make it easy and convert a compose file to command line:
# https://8gwifi.org/dc2.jsp

let servicename = "portainer";
in { config, ... }: {
  users.groups.docker.members = config.users.groups.wheel.members;
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  virtualisation.oci-containers = {
    backend = "docker";
    containers."${servicename}" = {
      image = "portainer/portainer-ce:latest";
      autoStart = true;
      ports = [ "0.0.0.0:9000:9000" "0.0.0.0:8000:8000" ];
      volumes = [
        "/etc/localtime:/etc/localtime:ro"
        "/var/run/docker.sock:/var/run/docker.sock"
        "/mnt/zfsDatabases/containers/portainer/data:/data"
      ];
      extraOptions = [
        "--security-opt=no-new-privileges"
        "--network=bridge"
        #"--log-driver=loki"
        #"--log-opt loki-url=http://loki.valhalla:3100/loki/api/v1/push"
      ];
    };
  };
}
