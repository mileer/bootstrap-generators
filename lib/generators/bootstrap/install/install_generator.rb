require 'rails'

module Bootstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Copy BootstrapGenerators default files'
      source_root File.expand_path('../templates', __FILE__)
      class_option :layout, :desc => 'Bootstrap layout templates (hero or fluid)', :default => 'hero', :type => :string
      class_option :form_builder, :desc => 'Select your form builder (simple_form or form_builder)', :default => 'simple_form', :type => :string

      class_option :template_engine
      class_option :stylesheet_engine

      def copy_lib
        directory "lib/templates/#{options[:template_engine]}"
      end

      def copy_form_builder
        if options[:form_builder].nil?
          copy_file "form_builders/form_builder/_form.html.#{options[:template_engine]}", "lib/templates/#{options[:template_engine]}/scaffold/_form.html.#{options[:template_engine]}"
        else
          copy_file "form_builders/#{options[:form_builder]}/_form.html.#{options[:template_engine]}", "lib/templates/#{options[:template_engine]}/scaffold/_form.html.#{options[:template_engine]}"
        end
      end

      def copy_simple_form_config
        if options[:form_builder] == 'simple_form'
          directory 'config'
        end
      end

      def create_layout
        template "layouts/#{options[:layout]}.html.#{options[:template_engine]}", "app/views/layouts/application.html.#{options[:template_engine]}"
      end

      def create_stylesheets
        if options[:stylesheet_engine].nil? || options[:stylesheet_engine].to_sym == :css
          stylesheet_extension = 'css'
        elsif options[:stylesheet_engine].to_sym == :less
          stylesheet_extension = "css.#{options[:stylesheet_engine]}"
          copy_file "assets/stylesheets/bootstrap-variables.less", "app/assets/stylesheets/bootstrap-variables.less"
        else
          stylesheet_extension = "css.#{options[:stylesheet_engine]}"
          copy_file "assets/stylesheets/bootstrap-variables.#{stylesheet_extension}", "app/assets/stylesheets/bootstrap-variables.#{stylesheet_extension}"
        end

        copy_file "assets/stylesheets/#{options[:layout]}.#{stylesheet_extension}", "app/assets/stylesheets/bootstrap-generators.#{stylesheet_extension}"
      end

      def inject_backbone
        application_js_path = "app/assets/javascripts/application.js"
        if File.exists?(File.join(destination_root, application_js_path))
          inject_into_file application_js_path, :before => "//= require_tree" do
            "//= require bootstrap\n"
          end
        end
      end
    end
  end
end
