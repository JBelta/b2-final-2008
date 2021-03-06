require 'rails_helper'

describe Doctor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :university }
    it { should validate_presence_of :speciality }
  end

  describe "relationships" do
    it {should belong_to :hospital}
    it {should have_many :patients}
  end
end
