# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "dm-dragonfly"
  s.version     = "0.1.1"
  s.authors     = ["Mike Richards"]
  s.date        = "2011-08-08"
  s.description = "DataMapper extensions to support Dragonfly"
  s.summary     = "DataMapper extensions to support Dragonfly"
  s.homepage    = "http://github.com/mikeric/dm-dragonfly"
  s.email       = "mike22e@gmail.com"
  
  s.require_path = "lib"
  
  s.files = ["lib/dm-dragonfly.rb"]
  
  s.required_rubygems_version = ">= 1.3.6"
  
  s.add_dependency "dragonfly", ["~> 0.9.0"]
end
