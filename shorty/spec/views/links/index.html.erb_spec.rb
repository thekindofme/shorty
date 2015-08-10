require 'spec_helper'

describe "links/index" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :url => "Url",
        :shortended_url => "Shortended Url"
      ),
      stub_model(Link,
        :url => "Url",
        :shortended_url => "Shortended Url"
      )
    ])
  end

  it "renders a list of links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Shortended Url".to_s, :count => 2
  end
end
