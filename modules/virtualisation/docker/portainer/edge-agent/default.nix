let servicename = "portainer-edge-agent";
in { config, ... }: {
  users.groups.docker.members = config.users.groups.wheel.members;
  virtualisation.docker = { enable = true; };

  virtualisation.oci-containers = {
    backend = "docker";
    containers."${servicename}" = {
      image = "portainer/agent:2.13.0";
      autoStart = true;
      volumes = [
        "/var/lib/docker/volumes:/var/lib/docker/volumes"
        "/var/run/docker.sock:/var/run/docker.sock"
        "/:/host"
        "portainer_agent_data:/data"
      ];
      environment = {
        EDGE = "1";
        EDGE_ID = "e429442b-e27c-4eb8-8c5a-0499aeb9f269";
        EDGE_KEY = "aHR0cDovL3BvcnRhaW5lci52YWxoYWxsYTo5MDAwfHBvcnRhaW5lci52YWxoYWxsYTo4MDAwfDQ2OmI3OjRhOmEzOjIxOjk3OjEzOjE1OmI3OmU3OjQ4OjQwOjEyOjE0OmE4OmQ2fDQ";
        EDGE_INSECURE_POLL = "1";
      };
      extraOptions = [ ];
    };
  };
}
