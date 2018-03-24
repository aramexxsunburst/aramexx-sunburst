variable "heroku_api_key" {}

provider "heroku" {
  email = "xander@gahancorporation.com"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_pipeline" "aramexx-sunburst-pipeline" {
  name = "aramexx-sunburst-pipeline"
}
