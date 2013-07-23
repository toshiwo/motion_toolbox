class MotionActiveSettings

  @@config = nil

  class << self
    def config
      if defined? MOTION_CONFIG_ENV and @@config == nil
        @@config = Marshal.restore([MOTION_CONFIG_ENV].pack('H*'))
        @@config.freeze
      end

      @@config
    end
  end

end
