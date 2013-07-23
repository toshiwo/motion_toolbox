module Motion
  module Project
    class XcodeConfig
      alias :define_global_env_txt_origin :define_global_env_txt

      def define_global_env_txt
        default_global_const_str = define_global_env_txt_origin

        additional_global_const default_global_const_str
      end

      def additional_global_const str
        config_data = MotionActiveSettings::Configure.new.load_file Motion::Project::App.config.project_dir, Motion::Project::App.config.build_mode_name

        if config_data
          str += "rb_define_global_const(\"MOTION_CONFIG_ENV\", @\"#{ Marshal.dump(config_data).unpack('H*').first }\");\n"
        end

        str
      end
      private :additional_global_const

    end
  end
end
