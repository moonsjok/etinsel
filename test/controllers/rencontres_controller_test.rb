require 'test_helper'

class RencontresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rencontres_index_url
    assert_response :success
  end

end
