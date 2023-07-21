require "rails_helper"

RSpec.describe "/merchants/:id", type: :feature do
  describe "when a user visits a merchant path" do
    it "should see all items that belong to a merchant" do
      visit merchant_path(1)

      within ".header" do 
        expect(page).to have_content("Schroeder-Jerde")
      end

      within ".merchant_items" do 
        expect(page).to have_content("Item Nemo Facere")
        expect(page).to have_content("Item Quidem Suscipit")
        expect(page).to have_content("Item Ea Voluptatum")
      end
    end
  end
end
