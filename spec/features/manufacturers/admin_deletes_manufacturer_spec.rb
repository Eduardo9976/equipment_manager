require 'rails_helper'

feature 'Admin deletes manufacturer' do
  scenario 'successfully' do
    Manufacturer.create!(name: 'Lenovo')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Lenovo'
    click_on 'Apagar fabricante'

    expect(current_path).to eq manufacturers_path
    expect(page).to have_content('Nenhum fabricante cadastrado')
  end

  scenario 'and keep anothers' do
    Manufacturer.create!(name: 'Dell')
    Manufacturer.create!(name: 'Lenovo')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Dell'
    click_on 'Apagar fabricante'

    expect(current_path).to eq manufacturers_path
    expect(page).not_to have_content('Dell')
    expect(page).to have_content('Lenovo')
  end
end