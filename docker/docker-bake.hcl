target "docker-metadata-action" {}

target "build-dev" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "./docker/Dockerfile.dev"
  platforms = ["linux/amd64"]
}
target "build-dev-all" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "./docker/Dockerfile.dev"
  platforms = ["linux/amd64", "linux/arm/v6", "linux/arm/v7", "linux/arm64"]
}

target "build" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "./docker/Dockerfile"
  platforms = ["linux/amd64"]
}
target "build-all" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "./docker/Dockerfile"
  platforms = ["linux/amd64", "linux/arm/v6", "linux/arm/v7", "linux/arm64"]
}
