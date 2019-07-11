# Download the latest Ghost Image
# terraform workspace new prod
# terraform apply -var env=prod
# terraform workspace new dev
# terraform apply -var env=dev
# terraform workspace select prod
# terraform show

module "image" {
  source = "./image"
  image  = "${lookup(var.image, var.env)}"
}

# Start the Container
module "container" {
  source   = "./container"
  image    = "${module.image.image_out}"
  name     = "${lookup(var.container_name, var.env)}"
  int_port = "${lookup(var.int_port, var.env)}"
  ext_port = "${lookup(var.ext_port, var.env)}"
}

resource "null_resource" "sg" {
  provisioner "local-exec" {
    command = "../lab-scripts/sg.sh"
  }
}
