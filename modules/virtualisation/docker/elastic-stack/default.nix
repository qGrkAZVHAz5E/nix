let servicename = "breaches";
in { config, ... }: {
  users.groups.docker.members = config.users.groups.wheel.members;
  virtualisation.docker = { enable = true; };

  virtualisation.oci-containers = {
    backend = "docker";
    containers."${servicename}" = {
      image = "docker.elastic.co/kibana/kibana:8.2.0";
      autoStart = true;
      ports = [ "0.0.0.0:5601:5601" "0.0.0.0:5601:5601" ];
      volumes = [
        "./kibana.yml:/usr/share/kibana/config/kibana.yml"
        "certs:/usr/share/kibana/config/certs"
      ];
      environment = {
        ELASTICSEARCH_URL = "http://es01:9200";
        ELASTICSEARCH_HOSTS = '["http://es01:9200","http://es02:9200","http://es03:9200","http://es04:9200","http://es05:9200"]';
        ELASTICSEARCH_USERNAME = "kibana_system";
        ELASTICSEARCH_PASSWORD = "b5MdENmINrc6bgxA8xpE";
        ELASTICSEARCH_SSL_CERTIFICATEAUTHORITIES = config/certs/ca/elastic-stack-ca.p12;
        server.ssl.enabled = "true";
        server.ssl.certificate = "config/certs/ca/newfile.crt.pem";
        server.ssl.key = "config/certs/ca/newfile.key.pem";
        elasticsearch.ssl.cerificationMode = "none";
      };
      extraOptions = [
        "--security-opt=no-new-privileges"
        "--network=breaches"
        "--log-driver=loki"
        "--log-opt loki-url=http://loki.valhalla:3100/loki/api/v1/push"
      ];
    };
  };
}
