require 'test_helper'

class AnnoncesmiseenavantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annoncesmiseenavant = annoncesmiseenavants(:one)
  end

  test "should get index" do
    get annoncesmiseenavants_url
    assert_response :success
  end

  test "should get new" do
    get new_annoncesmiseenavant_url
    assert_response :success
  end

  test "should create annoncesmiseenavant" do
    assert_difference('Annoncesmiseenavant.count') do
      post annoncesmiseenavants_url, params: { annoncesmiseenavant: { annonce_id: @annoncesmiseenavant.annonce_id } }
    end

    assert_redirected_to annoncesmiseenavant_url(Annoncesmiseenavant.last)
  end

  test "should show annoncesmiseenavant" do
    get annoncesmiseenavant_url(@annoncesmiseenavant)
    assert_response :success
  end

  test "should get edit" do
    get edit_annoncesmiseenavant_url(@annoncesmiseenavant)
    assert_response :success
  end

  test "should update annoncesmiseenavant" do
    patch annoncesmiseenavant_url(@annoncesmiseenavant), params: { annoncesmiseenavant: { annonce_id: @annoncesmiseenavant.annonce_id } }
    assert_redirected_to annoncesmiseenavant_url(@annoncesmiseenavant)
  end

  test "should destroy annoncesmiseenavant" do
    assert_difference('Annoncesmiseenavant.count', -1) do
      delete annoncesmiseenavant_url(@annoncesmiseenavant)
    end

    assert_redirected_to annoncesmiseenavants_url
  end
end
