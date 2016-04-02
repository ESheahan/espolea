require 'rails_helper'

RSpec.describe "schedules/index", type: :view do
  before(:each) do
    assign(:schedules, [
      Schedule.create!(
        :treatment_options => "Treatment Options"
      ),
      Schedule.create!(
        :treatment_options => "Treatment Options"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    assert_select "tr>td", :text => "Treatment Options".to_s, :count => 2
  end
end
