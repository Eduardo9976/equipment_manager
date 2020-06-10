require 'rails_helper'

feature 'Admin search for collaborator' do
  scenario 'from partial name' do
    # Arrange
    collaborator = create(:collaborator)
    another_collaborator = create(:collaborator)
    # Act
    
    visit root_path
    click_on 'Colaboradores'
    fill_in 'Busca', with: collaborator.name
    click_on 'Pesquisar'

    
    # Assert
    expect(current_path).to eq search_collaborators_path
    expect(page).to have_content collaborator.name
    expect(page).to have_content collaborator.email

    expect(page).to_not have_content another_collaborator.name
    expect(page).to_not have_content another_collaborator.email
  end

  scenario 'from partial name with multiple results' do
    # Arrange
    collaborator = create(:collaborator, name: 'Roberto Carlos')
    another_collaborator = create(:collaborator, name: 'João Carlos')
    third_collaborator = create(:collaborator, name: 'Rafael Pedro')
    # Act
    visit root_path
    click_on 'Colaboradores'
    fill_in 'Busca', with: 'Carlos'
    click_on 'Pesquisar'

    
    # Assert
    expect(current_path).to eq search_collaborators_path
    expect(page).to have_content 'resultado da busca por: Carlos'
    expect(page).to have_content 'Número de colaboradores encontrados: 2'

    expect(page).to have_content collaborator.name
    expect(page).to have_content collaborator.email

    expect(page).to have_content another_collaborator.name
    expect(page).to have_content another_collaborator.email

    expect(page).not_to have_content third_collaborator.name
    expect(page).not_to have_content third_collaborator.email
  end

  scenario 'from registration' do
    # Arrange
    collaborator = create(:collaborator, name: 'Roberto Carlos')
    another_collaborator = create(:collaborator, name: 'João Carlos', registration: '162')
    third_collaborator = create(:collaborator, name: 'Rafael Carlos')
    # Act
    visit root_path
    click_on 'Colaboradores'
    fill_in 'Busca', with: '162'
    click_on 'Pesquisar'

    
    # Assert
    expect(current_path).to eq search_collaborators_path
    expect(page).to have_content 'resultado da busca por: 162'


    expect(page).to have_content another_collaborator.name
    expect(page).to have_content another_collaborator.email
    expect(page).to have_content another_collaborator.registration

    expect(page).not_to have_content collaborator.name
    expect(page).not_to have_content collaborator.email
    expect(page).not_to have_content collaborator.registration
  end
end