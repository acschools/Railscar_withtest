require 'rails_helper'
    # Story: Given that I am on the Car Simulator landing page, I can create a car, and then I can see the information I entered about the car, along with the speed of the simulated car, which starts at 0 Km/h.
RSpec.feature "SimulateCars", type: :feature, js: true do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make and year' do
        fill_in 'make', with: 'Mazda'
        fill_in 'year', with: '9000'
      end
      And 'I can submit the information' do
        click_button 'Simulate Car'
      end
      Then "I can see the car's info on the create page" do
        expect(page).to have_content('Make : Mazda')
        expect(page).to have_content('Year : 9000')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed : 0Km/h')
      end

      # Story: Given that I have created a car, when I click a button, then I make it speed up in 10Km/h increments.

      When "I can click the accelerate button" do
        click_button 'Accelerate'
      end
      Then 'the speed of the car should be 10Km/h higher' do
        expect(page).to have_content('Speed : 10Km/h')
      end
      # Given that I have created a car, when I click the brake button, then the car slows down by 7Km/h.
      When "I can click the brake button" do
        click_button 'Brake'
      end
      Then 'the speed of the car should be 7Km/h lower' do
        expect(page).to have_content('Speed : 3Km/h')
      end
      # Given that I have created a car, and accelerated it, when I repreatedly click the brake, then the car eventually slows down to 0Km/h and does not go backwards.
      When "I can click the brake button" do
        click_button 'Brake'
      end
      Then 'the speed of the car should be 7Km/h lower' do
        expect(page).to have_content('Speed : 0Km/h')
      end
      # Given that I have entered the make and model year, when clicking on a button labelled Simulate Car, then I am taken to create car page that shows whether the lights on the car are on or off. They start off.I can turn the lights on using a button that toggles between showing On and Off.
      When 'I arrive on the create page' do
        expect(page).to have_content('Lights : off')
      end
      When "I click the light switch" do
        click_button 'Light Switch'
      end
      Then 'the lights should switch from off to on' do
      expect(page).to have_content('Lights : on')
      end
      When "I click the light switch again" do
        click_button 'Light Switch'
      end
      Then 'the lights should switch from on to off' do
      expect(page).to have_content('Lights : off')
      end
      # Given that I have created a car, when I visit the car status page, then I can set and release the parking brake using radio buttons.
      When 'I arrive on the create page' do
        expect(page).to have_content('Parking Brake : release')
      end
      Then 'I select a radio button option the parking brake is released' do
        expect(page).to have_content('Parking Brake : release')
      end
      Then 'I change the radio button option the parking brake is set' do
      choose 'parking_brake_set'
      click_button "Update Parking Brake"
      end

      # Given that I have created a car, when the parking brake is set, then the accelerate button does not work.

      When 'The parking brake is set, the speed cannot increase' do
       expect(page).to have_content('Speed : 0Km/h')
      end
      # Given that I have created a car, when the car is moving, then the parking brake does not work.

      Then 'I select a radio button option the parking brake is released' do
        expect(page).to have_content('Parking Brake : set')
      end
      Then 'I change the radio button option the parking brake is release' do
      choose 'parking_brake_release'
      click_button "Update Parking Brake"
      end

      When "I can click the accelerate button" do
        click_button 'Accelerate'
      end
      Then 'the speed of the car should be 10Km/h higher' do
        expect(page).to have_content('Speed : 10Km/h')
      end

      Then 'I select a radio button option the parking brake is set' do
        expect(page).to have_content('Parking Brake : release')
      end
      Then 'I change the radio button option the parking brake is set' do
      choose 'parking_brake_set'
      click_button "Update Parking Brake"
      end
      Then 'the update parking brake should not change the parking brake status' do
      expect(page).to have_content('Parking Brake : release')
      end
      # Given that I have created a car, when I select a color on the index page, then it is displayed as the background color on make text of the car.


    end
  end
end
