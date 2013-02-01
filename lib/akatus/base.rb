module Akatus

  class InvalidEnvironment   < Exception; end
  class MissingConfiguration < Exception; end

  extend self

  attr_accessor :env, :config_file

  def config
    validate!
    @config ||= YAML.load_file(config_file)[env]
  end

  def config!
    @config = nil
    config
  end

  def seller_email
    config["email"]
  end
  def seller_api_key
    config["api_key"]
  end
  def akatus_uri
    config["uri"]
  end
  def akatus_api_uri
    akatus_uri + "/api/v1"
  end

  private
  def validate!
    raise InvalidEnvironment   unless %(production development test).include?(env)
    raise MissingConfiguration unless File.exist?(config_file)
  end
end
