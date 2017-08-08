require 'rails_helper'

RSpec.describe Worker, :type => :model do
  it "it validates full_name and birthdate is not empty" do
    @worker = Worker.new(first_name:"", last_name:"", patronymic_name:"",birthdate:"")
    @worker.valid?
    @worker.errors[:first_name].should_not be_empty
  end
end
