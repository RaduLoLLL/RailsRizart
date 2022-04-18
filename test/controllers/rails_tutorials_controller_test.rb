require "test_helper"

class RailsTutorialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rails_tutorial = rails_tutorials(:one)
  end

  test "should get index" do
    get rails_tutorials_url
    assert_response :success
  end

  test "should get new" do
    get new_rails_tutorial_url
    assert_response :success
  end

  test "should create rails_tutorial" do
    assert_difference("RailsTutorial.count") do
      post rails_tutorials_url, params: { rails_tutorial: { email: @rails_tutorial.email, first_name: @rails_tutorial.first_name, last_name: @rails_tutorial.last_name, phone: @rails_tutorial.phone, twitter: @rails_tutorial.twitter } }
    end

    assert_redirected_to rails_tutorial_url(RailsTutorial.last)
  end

  test "should show rails_tutorial" do
    get rails_tutorial_url(@rails_tutorial)
    assert_response :success
  end

  test "should get edit" do
    get edit_rails_tutorial_url(@rails_tutorial)
    assert_response :success
  end

  test "should update rails_tutorial" do
    patch rails_tutorial_url(@rails_tutorial), params: { rails_tutorial: { email: @rails_tutorial.email, first_name: @rails_tutorial.first_name, last_name: @rails_tutorial.last_name, phone: @rails_tutorial.phone, twitter: @rails_tutorial.twitter } }
    assert_redirected_to rails_tutorial_url(@rails_tutorial)
  end

  test "should destroy rails_tutorial" do
    assert_difference("RailsTutorial.count", -1) do
      delete rails_tutorial_url(@rails_tutorial)
    end

    assert_redirected_to rails_tutorials_url
  end
end
