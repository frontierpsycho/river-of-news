require 'spec_helper'

describe "partners/new" do
  before(:each) do
    assign(:partner, stub_model(Partner,
      :name => "MyString",
      :url => "URL"
    ).as_new_record)
  end

  it "renders new partner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", partners_path, "post" do
      assert_select "input#partner_name[name=?]", "partner[name]"
      assert_select "input#partner_url[name=?]", "partner[url]"
    end
  end
end
