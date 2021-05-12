require 'rails_helper'

RSpec.describe "parts/index", type: :view do
  before(:each) do
    assign(:parts, [
      Part.create!(
        part_number: "Part Number",
        description: "Description",
        manufacturer: "Manufacturer",
        stock_quantity: 2
      ),
      Part.create!(
        part_number: "Part Number",
        description: "Description",
        manufacturer: "Manufacturer",
        stock_quantity: 2
      )
    ])
  end

  it "renders a list of parts" do
    render
    assert_select "tr>td", text: "Part Number".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Manufacturer".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
