feature 'user can create new post' do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }
  let! (:post) { FactoryBot.create(:post, author: profile.name,
                                   profile_id: profile.user.id) }

  scenario 'route to create new post' do
    login_as user
    visit root_path
    click_on 'Nova história'

    expect(page).to have_link('Nova história')
  end

  scenario 'with basic information' do
    login_as user
    visit root_path
    click_on 'Nova história'

    fill_in 'Título', with: Faker::Movies::Lebowski.actor 
    fill_in 'Texto', with: Faker::Movies::Lebowski.quote
    fill_in 'Localização', with: Faker::Movies::Lebowski.character
    click_on 'Enviar'

    expect(root_path).to have_content(Faker::Movies::Lebowski.actor)
  end
end
