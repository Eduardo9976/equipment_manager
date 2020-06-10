require 'rails_helper'

feature 'Admin deletes collaborator' do
  scenario 'Successfully' do
    collaborator = create(:collaborator)
    another_collaborator = create(:collaborator)

    visit collaborator_path(collaborator)
    click_on 'Apagar'
  
    expect(current_path).to eq collaborators_path
    expect(page).to_not have_content(collaborator.name)  
    expect(page).to_not have_content(collaborator.email)  
    expect(page).to_not have_content(collaborator.registration)
    expect(page).to have_content(another_collaborator.name)
    expect(page).to have_content(another_collaborator.email)  
  end
  scenario 'deletes another collaborator' do
    collaborator = create(:collaborator)
    another_collaborator = create(:collaborator)

    visit collaborator_path(collaborator)
    click_on 'Apagar'
    visit collaborator_path(another_collaborator.id)
    click_on 'Apagar'
  
    expect(current_path).to eq collaborators_path
    expect(page).to_not have_content(collaborator.name)  
    expect(page).to_not have_content(collaborator.email)  
    expect(page).to_not have_content(collaborator.registration)
    expect(page).to_not have_content(another_collaborator.name)
    expect(page).to_not have_content(another_collaborator.email)
    expect(page).to have_content('Nenhum colaborador cadastrado')  
  end
end