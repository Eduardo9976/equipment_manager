require 'rails_helper'

feature 'admin register Collaborator' do
  scenario 'Successfully' do

    visit root_path
    click_on 'Colaboradores'

    expect(current_path).to eq collaborators_path
    expect(page).to have_content('Colaboradores')
    expect(page).to have_content('Novo Colaborador') 
    expect(page).to have_content('Voltar')
  end  
  scenario 'new Collaborator' do
    
    visit root_path
    click_on 'Colaboradores'
    click_on 'Novo Colaborador'

    
    fill_in "Nome",	with: "Eduardo Fernandes"
    fill_in  'E-mail', with: 'eduardo@fernandes.com'
    fill_in 'Matrícula', with: '162'
    click_on 'Enviar'

    expect(page).to have_content('Eduardo Fernandes')
    expect(page).to have_content('eduardo@fernandes.com')
    expect(page).to have_content('162')
 end   
end