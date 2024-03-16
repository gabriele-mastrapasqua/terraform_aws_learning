terraform {
  required_providers {
    docker = {
        source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  
}

resource "docker_image" "nginx_from_terraform" {
  name = "nginx"
  keep_locally = true
}

resource "docker_container" "nginx_from_terraform" {
  image = docker_image.nginx_from_terraform.image_id
  name = "tutorial"

  ports {
    internal = 80
    external = 8080
  }
}
