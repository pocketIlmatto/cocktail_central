require 'spec_helper'

describe "ingredients/new" do
  before(:each) do
    assign(:ingredient, stub_model(Ingredient,
      :drink_id => 1,
      :item_id => 1,
      :qty => "",
      :uom => "MyString"
    ).as_new_record)
  end

  it "renders new ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ingredients_path, "post" do
      assert_select "input#ingredient_drink_id[name=?]", "ingredient[drink_id]"
      assert_select "input#ingredient_item_id[name=?]", "ingredient[item_id]"
      assert_select "input#ingredient_qty[name=?]", "ingredient[qty]"
      assert_select "input#ingredient_uom[name=?]", "ingredient[uom]"
    end
  end
end
