require 'rails_helper'

feature 'Admin edit description' do
  scenario 'successfully' do
    manufacturer = create(:manufacturer)
    product = create(:product)
    description = create(:description)
    another_description = create(:description)

    visit description_path(description)

    expect(page).to have_content(description.model)
    expect(page).to have_content(description.serie_number)
    expect(page).to have_content(description.memory)
    expect(page).to have_content(description.hard_drive)
    expect(page).not_to have_content(another_description.model)
    expect(page).not_to have_content(another_description.serie_number)
  end
  scenario 'successfully' do
    manufacturer = create(:manufacturer)
    product = create(:product)
    description = create(:description)
    onother_description = create(:description)

    visit description_path(description)
    click_on 'Editar'
    fill_in "Modelo",	with: "Macbook Pro"
    fill_in "Memória", with: "16GB"
    click_on 'Enviar'

    expect(page).to have_content('Macbook Pro')
    expect(page).to have_content(description.serie_number)
    expect(page).to have_content('16GB')
    expect(page).to have_content(description.hard_drive)
  end
end