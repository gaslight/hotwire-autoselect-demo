require 'rails_helper'

RSpec.describe "parts/new", type: :view do
  before(:each) do
    assign(:part, Part.new(
      part_number: "MyString",
      description: "MyString",
      manufacturer: "MyString",
      stock_quantity: 1
    ))
  end

  it "renders new part form" do
    render

    assert_select "form[action=?][method=?]", parts_path, "post" do

      assert_select "input[name=?]", "part[part_number]"

      assert_select "input[name=?]", "part[description]"

      assert_select "input[name=?]", "part[manufacturer]"

      assert_select "input[name=?]", "part[stock_quantity]"
    end
  end
end
