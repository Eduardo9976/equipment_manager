require 'rails_helper'

feature 'admin register allocations' do 
  scenario 'admin visit allocations home page ' do


    visit root_path
    click_on 'Agregados'

    expect(current_path).to eq(allocations_path)
    expect(page).to have_content('Agregados')
    expect(page).to have_content('Voltar')  
  end
  scenario 'admin visit page new ' do


    visit root_path
    click_on 'Agregados'
    click_on 'Agregar'
    
    
    expect(current_path).to eq(new_allocation_path)
    expect(page).to have_content('Agregar')  
  end
  scenario 'admin register new allocation' do
    collaborator = create(:collaborator)
    product = create(:product)
    description = create(:description)


    visit root_path
    click_on 'Agregados'
    click_on 'Agregar'
    select collaborator.name, from: 'Colaborador'
    select product.name, from: 'Produto'
    select description.model, from: 'Equipamento'
    click_on 'Enviar'


    
    expect(page).to have_content(collaborator.name)
    expect(page).to have_content(collaborator.email)
    expect(page).to have_content(collaborator.registration)
    expect(page).to have_content(product.name)
    expect(page).to have_content(description.model)
    expect(page).to have_content(description.serie_number)
    expect(page).to have_content(description.memory)
    expect(page).to have_content(description.hard_drive)
    expect(page).to have_content(description.operational_system)
  end
end  