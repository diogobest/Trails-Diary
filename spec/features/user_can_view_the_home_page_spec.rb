# frozen_string_literal: true

feature 'user can view the' do
  scenario 'home page' do
    visit root_path

    expect(page).to have_content('Bem-Vindo')
  end
end
