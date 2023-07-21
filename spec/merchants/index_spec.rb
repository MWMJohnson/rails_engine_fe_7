require "rails_helper"

RSpec.describe "/merchants", type: :feature do
  describe "when a user visits merchants path" do
    it "should see all the merchants" do

      visit merchants_path

      within ".header" do
        expect(page).to have_content("Merchants")
      end
      
      within ".merchants" do
        expect(page).to have_content("Schroeder-Jerde")
        expect(page).to have_content("Rowe and Sons")
        expect(page).to have_content("Glover Inc")
      end
    end

    it "each merchant name is a link to its show page" do 
      visit merchants_path
      
      within ".merchants" do
        expect(page).to have_link("Schroeder-Jerde")
        expect(page).to have_link("Rowe and Sons")
        expect(page).to have_link("Glover Inc")

        click_link "Schroeder-Jerde"

        expect(current_path).to eq(merchant_path(1))
      end
    end
  end
end