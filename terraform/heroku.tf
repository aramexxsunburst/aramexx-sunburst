variable "heroku_api_key" {}

provider "heroku" {
  email = "xander@gahancorporation.com"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "staging" {
  name = "aramexx-sunburst-staging"
  region = "us"
}

resource "heroku_app" "production" {
  name = "aramexx-sunburst-production"
  region = "us"
}

resource "heroku_pipeline" "aramexx-sunburst-pipeline" {
  name = "aramexx-sunburst-pipeline"
}

resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.aramexx-sunburst-staging.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.aramexx-sunburst-production.id}"
  stage    = "production"
}
