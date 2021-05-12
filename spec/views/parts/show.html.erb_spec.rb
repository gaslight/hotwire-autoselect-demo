require 'rails_helper'

RSpec.describe "parts/show", type: :view do
  before(:each) do
    @part = assign(:part, Part.create!(
      part_number: "Part Number",
      description: "Description",
      manufacturer: "Manufacturer",
      stock_quantity: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Part Number/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Manufacturer/)
    expect(rendered).to match(/2/)
  end
end
