require "test_helper"

class TteServicingPharmaciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tte_servicing_pharmacy = tte_servicing_pharmacies(:one)
  end

  test "should get index" do
    get tte_servicing_pharmacies_url
    assert_response :success
  end

  test "should get new" do
    get new_tte_servicing_pharmacy_url
    assert_response :success
  end

  test "should create tte_servicing_pharmacy" do
    assert_difference("TteServicingPharmacy.count") do
      post tte_servicing_pharmacies_url, params: { tte_servicing_pharmacy: { city: @tte_servicing_pharmacy.city, name: @tte_servicing_pharmacy.name, pharmid: @tte_servicing_pharmacy.pharmid, phone: @tte_servicing_pharmacy.phone, state_id: @tte_servicing_pharmacy.state_id, street1: @tte_servicing_pharmacy.street1, street2: @tte_servicing_pharmacy.street2, zip: @tte_servicing_pharmacy.zip } }
    end

    assert_redirected_to tte_servicing_pharmacy_url(TteServicingPharmacy.last)
  end

  test "should show tte_servicing_pharmacy" do
    get tte_servicing_pharmacy_url(@tte_servicing_pharmacy)
    assert_response :success
  end

  test "should get edit" do
    get edit_tte_servicing_pharmacy_url(@tte_servicing_pharmacy)
    assert_response :success
  end

  test "should update tte_servicing_pharmacy" do
    patch tte_servicing_pharmacy_url(@tte_servicing_pharmacy), params: { tte_servicing_pharmacy: { city: @tte_servicing_pharmacy.city, name: @tte_servicing_pharmacy.name, pharmid: @tte_servicing_pharmacy.pharmid, phone: @tte_servicing_pharmacy.phone, state_id: @tte_servicing_pharmacy.state_id, street1: @tte_servicing_pharmacy.street1, street2: @tte_servicing_pharmacy.street2, zip: @tte_servicing_pharmacy.zip } }
    assert_redirected_to tte_servicing_pharmacy_url(@tte_servicing_pharmacy)
  end

  test "should destroy tte_servicing_pharmacy" do
    assert_difference("TteServicingPharmacy.count", -1) do
      delete tte_servicing_pharmacy_url(@tte_servicing_pharmacy)
    end

    assert_redirected_to tte_servicing_pharmacies_url
  end
end
