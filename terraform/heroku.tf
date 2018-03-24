variable "heroku_api_key" {}

provider "heroku" {
  email = "xander@gahancorporation.com"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "staging" {
  name = "aramexx-sunburst-staging"
}

resource "heroku_app" "production" {
  name = "aramexx-sunburst-production"
}

resource "heroku_pipeline" "aramexx-sunburst-pipeline" {
  name = "aramexx-sunburst-pipeline"
}
