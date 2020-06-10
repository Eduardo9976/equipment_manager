require 'rails_helper'

feature 'Admin view page products' do
  scenario 'Visit products in page' do
    visit root_path
    click_on 'Produtos'

    expect(page).to have_link('Voltar', href: root_path)
    expect(page).to have_link('Novo Produto', href: new_product_path)
  end
  scenario 'admin register product' do
    manufacturer = create(:manufacturer, name: 'Dell')
    visit new_product_path

    fill_in 'Nome', with: 'Notebook'
    select manufacturer.name, from: 'Fabricante'
    click_on 'Enviar'

    expect(page).to have_content('Nome: Notebook')
    expect(page).to have_content('Fabricante: Dell')
  end
  scenario 'no registered products' do
    

    visit products_path

    expect(page).to have_content('Nenhum produto cadastrado')
  end  
  scenario 'view all products' do
    manufacturer = Manufacturer.create!(name: 'Dell')
    other_manufacturer = Manufacturer.create!(name: 'LG')
    visit new_product_path

    fill_in 'Nome', with: 'Notebook'
    select manufacturer.name, from: 'Fabricante'
    click_on 'Enviar'

    visit new_product_path

    fill_in 'Nome', with: 'Celular'
    select other_manufacturer.name, from: 'Fabricante'
    click_on 'Enviar'


    visit products_path

    expect(page).to have_content('Notebook')
    expect(page).to have_content('Dell')
    expect(page).to have_content('Celular')
    expect(page).to have_content('LG')
  end  
  
end
