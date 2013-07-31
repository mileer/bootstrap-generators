require 'generators/bootstrap/install/install_generator'
require 'test_helper'

class InstallGeneratorTest < ::Rails::Generators::TestCase
  tests Bootstrap::Generators::InstallGenerator
  destination File.join(Rails.root)
  teardown :cleanup_destination_root

  test "generates file" do
    run_generator

    assert_file "generated_bootstrap_file.rb"
  end

  private

  def cleanup_destination_root
    # FileUtils.rm_r(destination_root)
  end
end
