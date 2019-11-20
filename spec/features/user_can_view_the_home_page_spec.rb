# frozen_string_literal: true

require 'rails_helper'
feature 'user can view the' do
  scenario 'login page if he/she doesn\'t have a user account' do
    visit root_path

    expect(page).to have_content('Log in')
    expect(page).to have_content('E-mail')
    expect(page).to have_content('Cadastrar-se')
    expect(page).to have_content('Esqueceu sua senha?')
    expect(page).to have_content('Para continuar, faça login ou registre-se.')
  end

  scenario 'posts after login' do
    user = create(:user)

    login_as user
    visit root_path

    expect(page).to have_content('Autor:')
    expect(page).to have_content('Título:')
  end

  scenario 'profile page' do
    user = create(:user)

    login_as user
    visit root_path

    expect(page).to have_content('logout')
    expect(page).to have_content('Perfil')
  end
end
