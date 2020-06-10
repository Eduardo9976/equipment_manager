
require 'rails_helper'

feature 'Visitor view manufacturers' do
  scenario 'successfully' do
    # Arrange
    Manufacturer.create!(name: 'Lenovo')
    Manufacturer.create!(name: 'Dell')

    # Act
    visit root_path
    click_on 'Fabricantes'

    # Assert
    expect(page).to have_content('Lenovo')
    expect(page).to have_content('Dell')
  end

  scenario 'and view details' do
    Manufacturer.create!(name: 'Lenovo')
    Manufacturer.create!(name: 'Dell')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Lenovo'

    expect(page).to have_content('Lenovo')
    expect(page).not_to have_content('Dell')
  end

  scenario 'and no manufacturers are created' do
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_content('Nenhum fabricante cadastrado')
  end

  scenario 'and return to home page' do
    Manufacturer.create!(name: 'Lenovo')
    Manufacturer.create!(name: 'Dell')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to manufacturers page' do
    Manufacturer.create!(name: 'Lenovo')
    Manufacturer.create!(name: 'Dell')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Dell'
    click_on 'Voltar'

    expect(current_path).to eq manufacturers_path
  end
end