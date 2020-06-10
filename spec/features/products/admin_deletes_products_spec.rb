require 'rails_helper'

feature 'Admin delete product' do
  scenario 'Successfully' do
    manufacturer = create(:manufacturer)
    product = create(:product)

    visit product_path(product.id)
    click_on 'Apagar'

    expect(current_path).to eq products_path
    expect(page).to have_content('Nenhum produto cadastrado')
  end
  scenario 'and keep anothers' do
    manufacturer = create(:manufacturer)
    product = create(:product)
    anotherProduct = create(:product)

    visit product_path(product.id)
    click_on 'Apagar'

    expect(current_path).to eq products_path
    expect(page).to have_content(anotherProduct.name)
  end

end