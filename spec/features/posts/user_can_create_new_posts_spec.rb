# frozen_string_literal: true

require 'rails_helper'

feature 'user can create new post' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:profile) { FactoryBot.create(:profile, user_id: user.id) }
  let(:title) { Faker::Movies::Lebowski.actor }
  let(:text) { Faker::Movies::Lebowski.quote }
  let(:state) { 'SP' }

  context 'user have tool to create new post' do
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
      within('.form') do
        fill_in 'Titulo', with: title
        fill_in 'Texto', with: text
        fill_in 'Estado', with: state
        click_on 'Enviar'
      end

      expect(page).to have_content(title)
      expect(page).to have_content(text)
    end
  end

  context 'user cannot create post with invalid info' do
    scenario 'invalid state' do
      login_as user
      visit root_path
      click_on 'Nova história'
      within('.form') do
        fill_in 'Titulo', with: title
        fill_in 'Texto', with: text
        fill_in 'Estado', with: 'ABC'
        click_on 'Enviar'
      end

      expect(page).to have_content("${count} characters is allowed")
      expect(page).to have_content(text)
    end
  end
  scenario 'with basic information' do
    login_as user
    visit root_path
    click_on 'Nova história'
    within('.form') do
      fill_in 'Titulo', with: title
      fill_in 'Texto', with: text
      fill_in 'Estado', with: state
      click_on 'Enviar'
    end
  end

  scenario 'user can view details of trail' do
    login_as user
    visit root_path
    click_on 'Nova história'
    within('.form') do
      fill_in 'Titulo', with: 'São Paulo'
      fill_in 'Texto', with: 'São Paulo is amazing'
      fill_in 'Estado', with: 'SP'
      click_on 'Enviar'
    end

    expect(page).to have_link('São Paulo')
    expect(page).to have_link('São Paulo is amazing')
    expect(page).to have_link('SP')
  end
end
