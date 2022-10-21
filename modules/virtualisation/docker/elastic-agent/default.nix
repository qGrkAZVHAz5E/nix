let
    servicename = "elastic-agent";
in { config, ... }:
{
  users.groups.docker.members = config.users.groups.wheel.members;
    virtualisation.docker = {
	  enable = true;
  };

  virtualisation.oci-containers= {
    backend = "docker";
    containers."${servicename}" = {
      image = "docker.elastic.co/beats/elastic-agent:8.1.2";
      autoStart = true;
      ports = ["0.0.0.0:8220:8220"];
      volumes = [
        "/etc/localtime:/etc/localtime:ro"
	      "/var/run/docker.sock:/var/run/docker.sock"
      ];
      environment = {
        UID="1000";
        GID="1000";
        FLEET_ENROLLMENT_TOKEN="NElwQURvQUJMWDV3bXNOTW9KS1I6YVhJUktWS1NRbG1aUHVDN2hDY0pNQQ==";
        FLEET_ENROLL="1";
        FLEET_URL="http://fleet.valhalla:8220";
        FLEET_INSECURE="1";
      };
      extraOptions = [ "--hostname=nixos-desktop" ];
    };
  };
}