# frozen_string_literal: true

require 'rails_helper'

feature 'user can create new post' do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }

  scenario 'route to create new post' do
    login_as user
    visit root_path
    click_on 'Nova história'

    expect(page).to have_link('Nova história')
  end

  scenario 'with basic information' do
    titulo = Faker::Movies::Lebowski.actor
    texto = Faker::Movies::Lebowski.quote
    localizacao = "Sao Paulo"

    login_as user
    visit root_path
    click_on 'Nova história'
    within('.form') do
      fill_in 'Titulo', with: titulo
      fill_in 'Texto', with: texto
      fill_in 'Localizacao', with: localizacao
      click_on 'Enviar'
    end

    expect(page).to have_content(titulo)
    expect(page).to have_content(texto)
  end
end
