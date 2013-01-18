class AkatusGenerator < Rails::Generators::Base

  def create_yml_file
    copy_file "templates/akatus.yml", "config/akatus.yml"
  end
end