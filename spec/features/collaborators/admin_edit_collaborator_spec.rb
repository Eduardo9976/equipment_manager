require 'rails_helper'

feature 'Admin edit Collaborator' do
  scenario 'successfully' do
    collaborator = create(:collaborator)
    another_collaborator = create(:collaborator)

    visit collaborator_path(collaborator)

    expect(page).to have_content(collaborator.name)
    expect(page).to have_content(collaborator.email)
    expect(page).to have_content(collaborator.registration)
    expect(page).to_not have_content(another_collaborator.name)
    expect(page).to_not have_content(another_collaborator.registration)
  end
  scenario 'edit with success' do
    collaborator = create(:collaborator)
    another_collaborator = create(:collaborator)

    visit collaborator_path(collaborator)
    click_on 'Editar'
    fill_in "Nome",	with: "Eduardo Fernandes"
    fill_in "Matrícula", with: "162"
    click_on 'Enviar'

    expect(page).to have_content('Eduardo Fernandes')
    expect(page).to have_content('162')
    expect(page).to_not have_content(another_collaborator.registration)
    expect(page).to_not have_content(another_collaborator.name)
  end
end