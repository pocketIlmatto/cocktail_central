require 'spec_helper'

describe "ingredients/show" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :drink_id => 1,
      :item_id => 2,
      :qty => "",
      :uom => "Uom"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(//)
    rendered.should match(/Uom/)
  end
end
