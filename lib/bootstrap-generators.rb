module Bootstrap
  module Generators
    class Engine < ::Rails::Engine
      config.less.paths << File.expand_path('../../vendor/twitter/bootstrap/less', __FILE__) if config.respond_to?(:less)
      config.assets.paths << File.expand_path('../../vendor/twitter/bootstrap/sass', __FILE__)
    end
  end
end
