# production values are: prod_blog, ghost:alpine, 2368, 80
# dev values are: dev_blog, ghost:latest, 2368, 8080


container_name = {
    dev = "dev_blog"
    prod = "prod_blog"
}

image = {
    dev = "ghost:latest"
    prod = "ghost:alpine"
}

int_port = {
    dev = "2368"
    prod = "2368"
}


ext_port = {
    dev = "8080"
    prod = "80"
}


