terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.20.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "custom_image" {
  name = "myapp:1.0"
}

resource "docker_container" "myapp_container" {
  name  = "terraform-myapp"
  image = docker_image.custom_image.name

  ports {
    internal = 3000
    external = 3000
  }

  env = [
    "APP_ENV=development",
    "PORT=3000"
  ]

  volumes {
    host_path      = abspath("${path.module}/data")
    container_path = "/app/data"
  }
}
