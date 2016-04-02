require 'rails_helper'

RSpec.describe "schedules/show", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      :treatment_options => "Treatment Options"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Treatment Options/)
  end
end
