require 'test_helper'

class VuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vue = vues(:one)
  end

  test "should get index" do
    get vues_url
    assert_response :success
  end

  test "should get new" do
    get new_vue_url
    assert_response :success
  end

  test "should create vue" do
    assert_difference('Vue.count') do
      post vues_url, params: { vue: { annonce_id: @vue.annonce_id, pays: @vue.pays, quartier: @vue.quartier, user_id: @vue.user_id, ville: @vue.ville } }
    end

    assert_redirected_to vue_url(Vue.last)
  end

  test "should show vue" do
    get vue_url(@vue)
    assert_response :success
  end

  test "should get edit" do
    get edit_vue_url(@vue)
    assert_response :success
  end

  test "should update vue" do
    patch vue_url(@vue), params: { vue: { annonce_id: @vue.annonce_id, pays: @vue.pays, quartier: @vue.quartier, user_id: @vue.user_id, ville: @vue.ville } }
    assert_redirected_to vue_url(@vue)
  end

  test "should destroy vue" do
    assert_difference('Vue.count', -1) do
      delete vue_url(@vue)
    end

    assert_redirected_to vues_url
  end
end
