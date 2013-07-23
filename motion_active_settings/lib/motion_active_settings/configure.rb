require 'yaml'

module MotionActiveSettings
  class Configure

    class << self
      def setup filename = 'config/app.yml'
        @@filename = filename
      end
    end

    def load_file project_dir, build_mode
      load_config_file project_dir, build_mode.downcase
    end

    def load_config_file project_dir, build_mode
      filename = File.expand_path(File.join(File.expand_path(project_dir), config_file))

      yaml = YAML.load_file filename

      yaml[build_mode]
    end
    private :load_config_file

    def config_file
      @@filename
    end
    private :config_file

  end
end
