require 'rails_helper'

RSpec.describe "parts/edit", type: :view do
  before(:each) do
    @part = assign(:part, Part.create!(
      part_number: "MyString",
      description: "MyString",
      manufacturer: "MyString",
      stock_quantity: 1
    ))
  end

  it "renders the edit part form" do
    render

    assert_select "form[action=?][method=?]", part_path(@part), "post" do

      assert_select "input[name=?]", "part[part_number]"

      assert_select "input[name=?]", "part[description]"

      assert_select "input[name=?]", "part[manufacturer]"

      assert_select "input[name=?]", "part[stock_quantity]"
    end
  end
end
