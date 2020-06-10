require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    manufacturer = create(:manufacturer, name: 'Lenovo')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Lenovo'
    click_on 'Editar'
    fill_in 'Nome', with: 'Dell'
    click_on 'Enviar'

    expect(page).to have_content('Dell')
  end

  scenario 'successfully' do
    manufacturer = create(:manufacturer, name: 'Dell')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Dell'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end

  scenario 'uniqueness manufacturer' do
    Manufacturer.create(name: 'Lenovo')
    Manufacturer.create(name: 'Dell')

    
    visit root_path
    click_on 'Fabricantes'
    click_on 'Lenovo'
    click_on 'Editar'
    fill_in 'Nome', with: 'Dell'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end
end
