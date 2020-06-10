require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path
    

    expect(page).to have_content('Gerenciador de equipamentos')
    expect(page).to have_content('Fabricantes')
  end
end