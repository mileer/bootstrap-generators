require 'test_helper'

class StaticAssetsTest < ActionDispatch::IntegrationTest
  %w{affix alert button carousel collapse dropdown modal popover scrollspy tab tooltip transition}.each do |filename|
    test "provides bootstrap.js with #{filename}.js on the asset pipeline" do
      visit '/assets/bootstrap.js'
      assert_match "Bootstrap: #{filename}.js", page.body
    end

    test "provides bootstrap/#{filename}.js on the asset pipeline" do
      visit "/assets/bootstrap/#{filename}.js"
      assert_match "Bootstrap: #{filename}.js", page.body
    end
  end

  test "provides bootstrap.scss on the asset pipeline" do
    visit "/assets/test-sass.css"
    assert_match "* Bootstrap v", page.body
  end

  test "provides bootstrap.less on the asset pipeline" do
    visit "/assets/test-less.css"
    assert_match "* Bootstrap v", page.body
  end
end
