require 'spec_helper'

describe "partners/edit" do
  before(:each) do
    @partner = assign(:partner, stub_model(Partner,
      :name => "MyString",
      :url => "URL"
    ))
  end

  it "renders the edit partner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", partner_path(@partner), "post" do
      assert_select "input#partner_name[name=?]", "partner[name]"
      assert_select "input#partner_url[name=?]", "partner[url]"
    end
  end
end
