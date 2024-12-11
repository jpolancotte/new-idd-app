require "application_system_test_case"

class TteServicingPharmaciesTest < ApplicationSystemTestCase
  setup do
    @tte_servicing_pharmacy = tte_servicing_pharmacies(:one)
  end

  test "visiting the index" do
    visit tte_servicing_pharmacies_url
    assert_selector "h1", text: "Tte servicing pharmacies"
  end

  test "should create tte servicing pharmacy" do
    visit tte_servicing_pharmacies_url
    click_on "New tte servicing pharmacy"

    fill_in "City", with: @tte_servicing_pharmacy.city
    fill_in "Name", with: @tte_servicing_pharmacy.name
    fill_in "Pharmid", with: @tte_servicing_pharmacy.pharmid
    fill_in "Phone", with: @tte_servicing_pharmacy.phone
    fill_in "State", with: @tte_servicing_pharmacy.state_id
    fill_in "Street1", with: @tte_servicing_pharmacy.street1
    fill_in "Street2", with: @tte_servicing_pharmacy.street2
    fill_in "Zip", with: @tte_servicing_pharmacy.zip
    click_on "Create Tte servicing pharmacy"

    assert_text "Tte servicing pharmacy was successfully created"
    click_on "Back"
  end

  test "should update Tte servicing pharmacy" do
    visit tte_servicing_pharmacy_url(@tte_servicing_pharmacy)
    click_on "Edit this tte servicing pharmacy", match: :first

    fill_in "City", with: @tte_servicing_pharmacy.city
    fill_in "Name", with: @tte_servicing_pharmacy.name
    fill_in "Pharmid", with: @tte_servicing_pharmacy.pharmid
    fill_in "Phone", with: @tte_servicing_pharmacy.phone
    fill_in "State", with: @tte_servicing_pharmacy.state_id
    fill_in "Street1", with: @tte_servicing_pharmacy.street1
    fill_in "Street2", with: @tte_servicing_pharmacy.street2
    fill_in "Zip", with: @tte_servicing_pharmacy.zip
    click_on "Update Tte servicing pharmacy"

    assert_text "Tte servicing pharmacy was successfully updated"
    click_on "Back"
  end

  test "should destroy Tte servicing pharmacy" do
    visit tte_servicing_pharmacy_url(@tte_servicing_pharmacy)
    click_on "Destroy this tte servicing pharmacy", match: :first

    assert_text "Tte servicing pharmacy was successfully destroyed"
  end
end
