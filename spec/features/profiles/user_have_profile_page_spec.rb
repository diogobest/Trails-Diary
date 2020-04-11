# frozen_string_literal: true
require 'rails_helper'

feature 'user can see menu for' do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }

  scenario 'profile page' do
    login_as user
    visit root_path

    save_page

    expect(page).to have_link('Perfil')
  end

  scenario 'button to edit profile' do
    login_as user
    visit root_path
    click_on 'Perfil'

    expect(page).to have_content('Salvar')
  end

  scenario 'edit profile info' do
    login_as user
    visit root_path
    click_on 'Perfil'
    fill_in 'Nome', with: 'outro_nome'
    fill_in 'Idade', with: 550
    click_on 'Salvar'

    expect(user.profile.name).to eq('outro_nome')
    expect(profile.age).to eq(550)
  end
end
