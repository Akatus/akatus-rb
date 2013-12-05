class AkatusGenerator < Rails::Generators::Base
  def self.source_root
    File.dirname(__FILE__)
  end

  def create_yml_file
    copy_file "templates/akatus.yml", "config/akatus.yml"
  end
end
