# encoding: utf-8
require './config/shotgun'

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie,
  key: "sample_app",
  secret: "CHANGE_ME"

require "rack/protection"
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Static,
  root: "public",
  urls: ["/javascripts", "/images"]

require 'cuba/contrib/text_helpers'
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Cuba::Render
Cuba.plugin Cuba::Sugar
Cuba.settings.store(:template_engine, "slim")

Cuba.define do

  helpers do
  end

  on "stylesheets", extension("css") do |file|
    res.headers["Cache-Control"] = "public, max-age=29030400" if req.query_string =~ /[0-9]{10}/
    res.headers["Content-Type"] = "text/css; charset=utf-8"
    res.write render("views/stylesheets/#{file}.sass", {}, load_paths: SASS_LOAD_PATHS )
  end

  on "invitaciones/:id" do |id|
    @invitacion = Invitacion.find_by_id(token_id)
    if @invitacion

    else
      res.redirect "/"
    end
  end

  on default do
    res.write view("index")
  end
end


