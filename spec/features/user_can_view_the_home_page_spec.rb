# frozen_string_literal: true

require 'rails_helper'

feature 'user can view ' do
  let! (:user) { FactoryBot.create(:user) }
  let! (:profile) { FactoryBot.create(:profile, user_id: user.id) }
  let! (:post) do
    FactoryBot.create(:post, author: profile.name,
                             profile_id: profile.user.id)
  end

  scenario 'cant view post without an account' do
    visit root_path

    expect(page).to have_content('Trails-Diary')
    expect(page).to have_content('Share all the beautiful places you visited and')
  end

  scenario 'can see the navbar' do
    visit root_path

    expect(page).to have_content('Home')
    expect(page).to have_content('Cadastrar-se')
  end

  scenario 'all posts after login' do
    user = create(:user)
    other_profile = create(:profile, user_id: user.id)
    other_post = create(:post, author: other_profile.name, profile_id: other_profile.user.id)

    login_as user
    visit root_path

    expect(page).to have_content('Autor:')
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

  describe 'User can see ' do
    it 'one card of a story on the home page' do
      login_as user
      visit root_path

      expect(page).to have_selector(:css, 'div.card', count: 1)
    end
  end
  describe 'and cant see more than one card' do
    it 'one card of a story on the home page' do
      login_as user
      visit root_path

      expect(page).not_to have_selector(:css, 'div.card', count: 22)
    end
  end
end
