module SemanticSassBootstrap
  module Rails
    # add vendor/assets to Rails asset pipeline :)
    class Engine < ::Rails::Engine
      initializer 'SemanticSassBootstrap config' do
      end
    end
  end
end
