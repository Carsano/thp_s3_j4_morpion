require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/board'
require 'app/player'
require 'app/boardcase'
require 'app/application'
require 'views/show'