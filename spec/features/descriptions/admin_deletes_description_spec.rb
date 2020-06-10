require 'rails_helper'

feature 'Admin deletes description' do
  scenario 'Successfully' do
    description = create(:description)
    another_description = create(:description)

    visit description_path(description)
    click_on 'Apagar'
  
    expect(current_path).to eq descriptions_path
    expect(page).to_not have_content(description.model)
    expect(page).to_not have_content(description.serie_number)
    expect(page).to_not have_content(description.memory)
    expect(page).to_not have_content(description.hard_drive)
    expect(page).to have_content(another_description.model)
    expect(page).to have_content(another_description.serie_number)
  end
  scenario 'deletes another description' do
    description = create(:description)
    another_description = create(:description)

    visit description_path(description)
    click_on 'Apagar'
    visit description_path(another_description.id)
    click_on 'Apagar'
  
    expect(current_path).to eq descriptions_path
    expect(page).to_not have_content(description.model)
    expect(page).to_not have_content(description.serie_number)
    expect(page).to_not have_content(description.memory)
    expect(page).to_not have_content(description.hard_drive)
    expect(page).to_not have_content(another_description.model)
    expect(page).to_not have_content(another_description.serie_number)
    expect(page).to have_content('Nenhuma informação cadastrada')  
  end
end