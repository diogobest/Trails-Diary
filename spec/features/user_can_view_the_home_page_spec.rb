# frozen_string_literal: true

require 'rails_helper'

feature 'user can view ' do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }
  let! (:post) { FactoryBot.create(:post, author: profile.name,
                                   profile_id: profile.user.id) }

  scenario 'login page if he/she doesn\'t have a user account' do
    visit root_path

    expect(page).to have_content('Log In')
    expect(page).to have_content('Cadastrar-se')
    expect(page).to have_content('Esqueceu sua senha?')
    expect(page).to have_content('Para continuar, faça login ou registre-se.')
  end

  scenario 'all posts after login' do
    other_user = create(:user) 
    other_profile = create(:profile, user_id: other_user.id) 
    other_post = create(:post, author: other_profile.name, profile_id: other_profile.user.id)

    login_as user
    visit root_path

    expect(page).to have_content('Autor:')
    expect(page).to have_content('Título:')
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.author)
    expect(page).to have_content(other_post.title)
    expect(page).to have_content(other_post.author)
  end

  scenario 'link to profile page' do
    login_as user
    visit root_path

    expect(page).to have_content('Sair')
    expect(page).to have_link('Perfil')
  end
end
