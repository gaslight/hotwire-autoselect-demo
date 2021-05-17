require 'rails_helper'

RSpec.describe "parts/index", type: :view do
  let(:part_numbers) { %w{MS90728-10 MS90728-11} }
  before(:each) do
    assign(:parts, [
      Part.create!(
        part_number: part_numbers[0],
        description: "Description",
        manufacturer: "Manufacturer",
        stock_quantity: 2
      ),
      Part.create!(
        part_number: part_numbers[1],
        description: "Description",
        manufacturer: "Manufacturer",
        stock_quantity: 2
      )
    ])
  end

  it "renders a list of parts" do
    render
    assert_select "tr>td", text: "MS90728-10".to_s, count: 1
    assert_select "tr>td", text: "MS90728-11".to_s, count: 1
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Manufacturer".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
