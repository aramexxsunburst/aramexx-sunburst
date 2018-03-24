variable "heroku_api_key" {}

provider "heroku" {
  email = "aramexx.sunburst@gmail.com"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "staging" {
  name = "aramexx-sunburst-stage"
  region = "us"
  buildpacks = [
    "heroku/python"
  ]
}

resource "heroku_app" "production" {
  name = "aramexx-sunburst-prod"
  region = "us"
  buildpacks = [
    "heroku/python"
  ]
}

resource "heroku_addon" "database" {
  app  = "${heroku_app.staging.name}"
  plan = "heroku-postgresql:hobby-basic"
}

resource "heroku_addon" "database" {
  app  = "${heroku_app.production.name}"
  plan = "heroku-postgresql:hobby-basic"
}

resource "heroku_pipeline" "aramexx-sunburst-pipe" {
  name = "aramexx-sunburst-pipe"
}

resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.aramexx-sunburst-pipe.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.aramexx-sunburst-pipe.id}"
  stage    = "production"
}
