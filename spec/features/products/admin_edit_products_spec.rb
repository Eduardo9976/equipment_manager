require 'rails_helper'

feature 'admin edit products' do
  scenario 'successfully' do 
    manufacturer = create(:manufacturer)

    visit new_product_path

    fill_in 'Nome', with: 'Notebook'
    select manufacturer.name, from: 'Fabricante'
    click_on 'Enviar'

    click_on 'Editar'

    fill_in 'Nome', with: 'Carregador'
    click_on 'Enviar'

    expect(page).to have_content('Carregador')
    expect(page).not_to have_content('Notebook')
  end
  scenario 'uniqueness product' do
    manufacturer = create(:manufacturer)
    product = create(:product)

    visit new_product_path
    fill_in 'Nome', with: product.name
    select manufacturer.name, from: 'Fabricante'
    click_on 'Enviar'


    expect(page).to have_content('já está em uso')
  end
  scenario ' name  blank product  must fail' do
    manufacturer = create(:manufacturer)

    visit new_product_path
    fill_in 'Nome', with: ' '
    select manufacturer.name, from: 'Fabricante'
    click_on 'Enviar'


    expect(page).to have_content('Nome não pode ficar em branco')
  end
end