require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  # Given that I am on the car simulator landing page, then I see Welcome to the Car Simulator
  context 'Going to website' do
   Steps 'Being welcomed' do
     Given 'I am on the landing page' do
       visit '/'
     end
     Then 'I can see a welcome message' do
       expect(page).to have_content 'Welcome'
     end
   end
 end
 # Given that I am on the landing page, then I can create a car based on make and model year of the car to be simulated.

  context 'filling in car info' do
    Steps 'Fill in car make and year' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make and year' do
        fill_in 'make', with: 'Nissan'
        fill_in 'year', with: '3000'
      end
    end
  end
end
