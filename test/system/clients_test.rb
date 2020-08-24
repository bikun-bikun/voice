require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Address", with: @client.address
    fill_in "Email", with: @client.email
    fill_in "Fax", with: @client.fax
    fill_in "Name", with: @client.name
    fill_in "Name kana", with: @client.name_kana
    fill_in "President", with: @client.president
    fill_in "President kana", with: @client.president_kana
    fill_in "Tel", with: @client.tel
    fill_in "Zip code", with: @client.zip_code
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "updating a Client" do
    visit clients_url
    click_on "Edit", match: :first

    fill_in "Address", with: @client.address
    fill_in "Email", with: @client.email
    fill_in "Fax", with: @client.fax
    fill_in "Name", with: @client.name
    fill_in "Name kana", with: @client.name_kana
    fill_in "President", with: @client.president
    fill_in "President kana", with: @client.president_kana
    fill_in "Tel", with: @client.tel
    fill_in "Zip code", with: @client.zip_code
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "destroying a Client" do
    visit clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client was successfully destroyed"
  end
end
