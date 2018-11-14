require 'test_helper'

class PublicitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publicite = publicites(:one)
  end

  test "should get index" do
    get publicites_url
    assert_response :success
  end

  test "should get new" do
    get new_publicite_url
    assert_response :success
  end

  test "should create publicite" do
    assert_difference('Publicite.count') do
      post publicites_url, params: { publicite: { duree: @publicite.duree, entreprise: @publicite.entreprise, resolution: @publicite.resolution } }
    end

    assert_redirected_to publicite_url(Publicite.last)
  end

  test "should show publicite" do
    get publicite_url(@publicite)
    assert_response :success
  end

  test "should get edit" do
    get edit_publicite_url(@publicite)
    assert_response :success
  end

  test "should update publicite" do
    patch publicite_url(@publicite), params: { publicite: { duree: @publicite.duree, entreprise: @publicite.entreprise, resolution: @publicite.resolution } }
    assert_redirected_to publicite_url(@publicite)
  end

  test "should destroy publicite" do
    assert_difference('Publicite.count', -1) do
      delete publicite_url(@publicite)
    end

    assert_redirected_to publicites_url
  end
end
