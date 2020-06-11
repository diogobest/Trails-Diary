# frozen_string_literal: true

require 'rails_helper'

feature 'user can see menu for' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:profile) { FactoryBot.create(:profile, user_id: user.id) }

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

    expect(page).to have_button('Salvar')
  end

  scenario 'edit profile info' do
    login_as user
    visit root_path
    click_on 'Perfil'
    within('.form') do
      fill_in 'Nome', with: 'outro_nome'
      fill_in 'Idade', with: 50
      fill_in 'Usuário', with: 'user'
      fill_in 'Cidade', with: 'Sao Paulo'
      fill_in 'Estado', with: 'Sao Paulo'
      click_on 'Salvar'
    end

    expect(Profile.last.name).to eq('outro_nome')
    expect(Profile.last.age).to eq(50)
    expect(Profile.last.username).to eq('user')
    expect(Profile.last.city).to eq('Sao Paulo')
    expect(Profile.last.state).to eq('Sao Paulo')
  end

  scenario 'name field is required' do
    login_as user
    visit root_path
    click_on 'Perfil'
    within('.form') do
      fill_in 'Nome', with: ''
      fill_in 'Idade', with: 50
      fill_in 'Usuário', with: 'user'
      fill_in 'Cidade', with: 'Sao Paulo'
      fill_in 'Estado', with: 'Sao Paulo'
      click_on 'Salvar'
    end

    expect(page).to have_content(I18n.t('profiles.errors.required_field'))
  end

  scenario 'age field is required' do
    login_as user
    visit root_path
    click_on 'Perfil'
    within('.form') do
      fill_in 'Nome', with: 'name'
      fill_in 'Idade', with: ''
      fill_in 'Usuário', with: 'user'
      fill_in 'Cidade', with: 'Sao Paulo'
      fill_in 'Estado', with: 'Sao Paulo'
      click_on 'Salvar'
    end

    expect(page).to have_content(I18n.t('profiles.errors.required_field'))
  end

  scenario 'age is invalid if it is less than 12' do
    login_as user
    visit root_path
    click_on 'Perfil'
    within('.form') do
      fill_in 'Nome', with: 'usuario'
      fill_in 'Idade', with: 11
      fill_in 'Usuário', with: 'user'
      fill_in 'Cidade', with: 'Sao Paulo'
      fill_in 'Estado', with: 'Sao Paulo'
      click_on 'Salvar'
    end

    expect(page).to have_content(I18n.t('profiles.errors.invalid_age'))
  end

  scenario 'age is invalid if it is greater than 120' do
    login_as user
    visit root_path
    click_on 'Perfil'
    within('.form') do
      fill_in 'Nome', with: 'usuario'
      fill_in 'Idade', with: 121
      fill_in 'Usuário', with: 'user'
      fill_in 'Cidade', with: 'Sao Paulo'
      fill_in 'Estado', with: 'Sao Paulo'
      click_on 'Salvar'
    end

    expect(page).to have_content(I18n.t('profiles.errors.invalid_age'))
  end
end
