module LIVE_SERVER
  class Railtie < Rails::Railtie
    initializer "live_server.configure" do |app|
      if app.config.respond_to?(:liveserver_defaults)
        LIVE_SERVER::Data.default_options.merge!(app.config.liveserver_defaults)
      end
    end

    # config.to_prepare do
    #   Railtie.setup!
    # end
    #
    # rake_tasks do
    #   load 'path/to/my_railtie.tasks'
    # end

  end
end