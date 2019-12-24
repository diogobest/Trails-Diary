# frozen_string_literal: true

feature 'user can see menu for' do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }

  scenario 'profile page' do
    login_as user
    visit root_path

    expect(page).to have_link('Perfil')
  end

  scenario 'button to edit profile' do
    create(:profile, user_id: user.id)

    login_as user
    visit root_path
    click_on 'Perfil'

    expect(page).to have_content('Editar')
  end

  scenario 'edit profile info' do
    profile = create(:profile, user_id: user.id)

    login_as user
    visit root_path
    click_on 'Perfil'
    click_on 'Editar'
    fill_in 'name', with: profile.name
    fill_in 'age', with: profile.age 
    click_on 'Enviar'

    expect(page).to have_content(profile.name)
    expect(page).to have_content(profile.age)
  end
end
