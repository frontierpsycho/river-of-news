require 'spec_helper'

describe "partners/index" do
  before(:each) do
    assign(:partners, [
      stub_model(Partner,
        :name => "Name",
        :unique_key => "Unique Key",
        :channel => "Channel"
      ),
      stub_model(Partner,
        :name => "Name",
        :unique_key => "Unique Key",
        :channel => "Channel"
      )
    ])
  end

  it "renders a list of partners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Unique Key".to_s, :count => 2
    assert_select "tr>td", :text => "Channel".to_s, :count => 2
  end
end
