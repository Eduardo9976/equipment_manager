require 'rails_helper'

feature 'Admin search for description' do
  scenario 'from partial name' do
    manufacturer = create(:manufacturer)
    product = create(:product)
    description = create(:description)
    another_description = create(:description)
    
    visit root_path
    click_on 'Informações do produto'
    fill_in 'Busca', with: description.serie_number
    click_on 'Pesquisar'

    
    # Assert
    expect(current_path).to eq search_descriptions_path
    expect(page).to have_content description.model
    expect(page).to have_content description.serie_number
    expect(page).to have_content description.warranty
    

    expect(page).to_not have_content another_description.serie_number
  end

  scenario 'from partial name with multiple results' do

    manufacturer = create(:manufacturer)
    product = create(:product)
    description = create(:description, model: 'Macbook Pro')
    another_description = create(:description, model: 'Macbook Pro')
    third_description = create(:description, model: 'S145')
    
    
    visit root_path
    click_on 'Informações do produto'
    fill_in 'Busca', with: description.model
    click_on 'Pesquisar'

    
    # Assert
    expect(current_path).to eq search_descriptions_path
    expect(page).to have_content 'resultado da busca por: Macbook Pro'
    expect(page).to have_content 'Número de colaboradores encontrados: 2'

    expect(page).to have_content description.model
    expect(page).to have_content description.serie_number

    expect(page).to have_content another_description.model
    expect(page).to have_content another_description.serie_number

    expect(page).not_to have_content third_description.model
    expect(page).not_to have_content third_description.serie_number
  end
end