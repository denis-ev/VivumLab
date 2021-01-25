target "ghaction-docker-meta" {}

target "build-dev" {
  inherits = ["ghaction-docker-meta"]
  context = "."
  dockerfile = "./docker/Dockerfile.dev"
  platforms = ["linux/amd64"]
}
target "build-dev-all" {
  inherits = ["ghaction-docker-meta"]
  context = "."
  dockerfile = "./docker/Dockerfile.dev"
  platforms = ["linux/amd64", "linux/arm/v6", "linux/arm/v7", "linux/arm64", "linux/386", "linux/ppc64le"]
}

target "build" {
  inherits = ["ghaction-docker-meta"]
  context = "."
  dockerfile = "./docker/Dockerfile"
  platforms = ["linux/amd64"]
}
target "build-all" {
  inherits = ["ghaction-docker-meta"]
  context = "."
  dockerfile = "./docker/Dockerfile"
  platforms = ["linux/amd64", "linux/arm/v6", "linux/arm/v7", "linux/arm64", "linux/386", "linux/ppc64le"]
}
