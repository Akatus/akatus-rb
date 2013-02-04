require "rspec"
require "akatus"

Akatus.env         = "test"
Akatus.config_file = File.join(File.dirname(__FILE__), "support/config/akatus.yml")
