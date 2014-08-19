require 'twitter'
require 'yaml'

YAML.load(File.open('config/application.yml')).each do |key, value|
  ENV[key.to_s] = value
end
