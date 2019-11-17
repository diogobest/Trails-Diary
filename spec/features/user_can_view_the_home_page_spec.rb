# frozen_string_literal: true
require 'rails_helper'
feature 'user can view the' do
  scenario 'home page' do
    visit root_path

    expect(page).to have_content('Login')
    expect(page).to have_content('Cadastrar')
    expect(page).to have_content('Recuperar senha')
  end

  scenario 'posts on the home page' do
    user = create(:user)

    login_as user
    visit root_path

    expect(page).to have_content('Autor:')
    expect(page).to have_content('Localização:')
    expect(page).to have_content('Título:')
    expect(page).to have_content('Texto:')
  end
end
