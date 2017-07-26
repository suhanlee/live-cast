module LIVE_SERVER
  class Data
    attr_accessor :host, :user, :password

    def self.default_options
      @defaults = {
        host: ENV.fetch('LIVE_SERVER_URL'),
        user: ENV.fetch('LIVE_SERVER_USER'),
        password: ENV.fetch('LIVE_SERVER_PASSWORD')
      };

      @default_options ||= @defaults
    end

    def initialize
      options = self.class.default_options

      @host = options[:host]
      @user = options[:user]
      @password = options[:password]
    end

  end
end