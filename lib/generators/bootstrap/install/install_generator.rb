module Bootstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Copy BootstrapGenerators default files"
      def creates_file
        create_file "generated_bootstrap_file.rb", "# Add content here"
      end
    end
  end
end
