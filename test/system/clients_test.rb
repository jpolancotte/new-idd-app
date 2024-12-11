require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Admin phone", with: @client.admin_phone
    fill_in "City", with: @client.city
    fill_in "Facid", with: @client.facid
    fill_in "Name", with: @client.name
    fill_in "State", with: @client.state_id
    fill_in "Street1", with: @client.street1
    fill_in "Street2", with: @client.street2
    fill_in "Tte servicing pharmacy", with: @client.tte_servicing_pharmacy_id
    fill_in "Zip", with: @client.zip
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Admin phone", with: @client.admin_phone
    fill_in "City", with: @client.city
    fill_in "Facid", with: @client.facid
    fill_in "Name", with: @client.name
    fill_in "State", with: @client.state_id
    fill_in "Street1", with: @client.street1
    fill_in "Street2", with: @client.street2
    fill_in "Tte servicing pharmacy", with: @client.tte_servicing_pharmacy_id
    fill_in "Zip", with: @client.zip
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
