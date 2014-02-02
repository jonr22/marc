require 'spec_helper'

describe "seasons/edit" do
  before(:each) do
    @season = assign(:season, stub_model(Season,
      :name => "MyString"
    ))
  end

  it "renders the edit season form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", season_path(@season), "post" do
      assert_select "input#season_name[name=?]", "season[name]"
    end
  end
end
