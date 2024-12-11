require "application_system_test_case"

class AgenciesTest < ApplicationSystemTestCase
  setup do
    @agency = agencies(:one)
  end

  test "visiting the index" do
    visit agencies_url
    assert_selector "h1", text: "Agencies"
  end

  test "should create agency" do
    visit agencies_url
    click_on "New agency"

    fill_in "Capacity", with: @agency.capacity
    fill_in "City", with: @agency.city
    fill_in "Company", with: @agency.company_id
    fill_in "County", with: @agency.county
    fill_in "License number", with: @agency.license_number
    fill_in "License status", with: @agency.license_status
    fill_in "License type", with: @agency.license_type
    fill_in "Licensing authority", with: @agency.licensing_authority
    fill_in "Name", with: @agency.name
    fill_in "Phone", with: @agency.phone
    fill_in "State", with: @agency.state_id
    fill_in "Street1", with: @agency.street1
    fill_in "Street2", with: @agency.street2
    fill_in "Zip", with: @agency.zip
    click_on "Create Agency"

    assert_text "Agency was successfully created"
    click_on "Back"
  end

  test "should update Agency" do
    visit agency_url(@agency)
    click_on "Edit this agency", match: :first

    fill_in "Capacity", with: @agency.capacity
    fill_in "City", with: @agency.city
    fill_in "Company", with: @agency.company_id
    fill_in "County", with: @agency.county
    fill_in "License number", with: @agency.license_number
    fill_in "License status", with: @agency.license_status
    fill_in "License type", with: @agency.license_type
    fill_in "Licensing authority", with: @agency.licensing_authority
    fill_in "Name", with: @agency.name
    fill_in "Phone", with: @agency.phone
    fill_in "State", with: @agency.state_id
    fill_in "Street1", with: @agency.street1
    fill_in "Street2", with: @agency.street2
    fill_in "Zip", with: @agency.zip
    click_on "Update Agency"

    assert_text "Agency was successfully updated"
    click_on "Back"
  end

  test "should destroy Agency" do
    visit agency_url(@agency)
    click_on "Destroy this agency", match: :first

    assert_text "Agency was successfully destroyed"
  end
end
