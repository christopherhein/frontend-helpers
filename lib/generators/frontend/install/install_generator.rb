require 'rails'

module Frontend
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs the necessary config files, for all your services and base site meta tags."
      source_root File.expand_path('../../../../../', __FILE__)

      def copy_services
        say_status("copying", "Blank Services File", :green)
        copy_file "config/services.yml", "config/services.yml"
      end

      def copy_settings
        say_status("copying", "Blank Settings File", :green)
        copy_file "config/settings.yml", "config/settings.yml"
      end

      def copy_variables
        say_status("copying", "Blank Variables File", :green)
        copy_file "vendor/assets/stylesheets/variables.css.sass", "app/assets/stylesheets/variables.css.sass"
      end

      def copy_email_template
        say_status("copying", "Email Template", :green)
        copy_file "app/views/layouts/mail.html.haml", "app/views/layouts/mail.html.haml"
      end

    end
  end
end