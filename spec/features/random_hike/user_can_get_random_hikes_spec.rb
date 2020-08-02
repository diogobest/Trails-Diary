# frozen_string_literal: true

require 'rails_helper'

feature 'user get random hikes recomendations' do
  let(:user) { FactoryBot.create(:user) }
  let(:profile) { FactoryBot.create(:profile, user_id: user.id) }

  scenario 'Link to view random hikes' do
    login_as user
    visit root_path
    click_on 'Nova história'

    expect(page).to have_link('Descubra novos lugares')
  end

  context 'structure of the page' do
    scenario 'user have a search bar' do
      login_as user
      visit random_hikes_path

      expect(page).to have_css('.search_bar')
    end
  end
end
