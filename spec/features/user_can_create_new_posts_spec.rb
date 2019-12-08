# frozen_string_literal: true

feature 'user can create new post' do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }
  #let! (:post) do
  #  FactoryBot.create(:post, author: profile.name,
  #                           profile_id: profile.user.id)
  #end

  scenario 'route to create new post' do
    login_as user
    visit root_path
    click_on 'Nova história'

    expect(page).to have_link('Nova história')
  end

  scenario 'with basic information' do
    titulo = Faker::Movies::Lebowski.actor
    texto = Faker::Movies::Lebowski.quote
    localizacao = Faker::Movies::Lebowski.character

    login_as user
    visit root_path
    click_on 'Nova história'
    fill_in 'Titulo', with: titulo
    fill_in 'Texto', with: texto
    fill_in 'Localizacao', with: localizacao
    click_on 'Enviar'

    expect(page).to have_content(titulo)
  end
end
