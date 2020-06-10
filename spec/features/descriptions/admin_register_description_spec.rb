require 'rails_helper'

feature 'admin register description' do
  scenario 'view index descriptions' do

    visit root_path
    click_on 'Informações do produto'

    expect(current_path).to eq descriptions_path
    expect(page).to have_content('Informações dos produtos')
    expect(page).to have_content('Registrar informações') 
    expect(page).to have_content('Voltar')

  end  
  scenario 'Successfully' do
    manufacturer = create(:manufacturer, name: 'APPLE')
    product = create(:product, name: 'Notebook')

    visit root_path
    click_on 'Informações do produto'
    click_on 'Registrar informações'

  
    
    select product.name, from: 'Produto'
    fill_in "Modelo",	with: "Macbook Pro 13 pol"
    fill_in  'Número de série', with: 'AYX1234ABC'
    fill_in 'Memória', with: '8GB'
    fill_in 'HD', with: '256GB'
    fill_in 'Sistema Operacional', with: 'Mac OS Sierra'
    fill_in "Garantia",	with: DateTime.now + 1.year
    
    click_on 'Enviar'

    

    expect(page).to have_content(product.name)
    expect(page).to have_content("Macbook Pro 13 pol")  
    expect(page).to have_content('AYX1234ABC')  
    expect(page).to have_content('8GB')  
    expect(page).to have_content('256GB')  
    expect(page).to have_content('Mac OS Sierra')  
    expect(page).to have_content(DateTime.now + 1.year)
 end   
end