require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'from index page' do
    
    visit root_path
    click_on 'Fabricantes'

    
    expect(page).to have_link('Novo Fabricante', href: new_manufacturer_path)
    expect(page).to have_content('Nenhum fabricante cadastrado')
  end

  scenario 'successfully' do
   
    visit root_path
    click_on 'Fabricantes'
    click_on 'Novo Fabricante'

    fill_in 'Nome', with: 'Lenovo'
    click_on 'Enviar'

    expect(current_path).to eq manufacturer_path(Manufacturer.last.id)
    expect(page).to have_content('Lenovo')
    expect(page).to have_link('Voltar')
  end
end