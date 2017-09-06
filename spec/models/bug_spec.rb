require 'rails_helper'

RSpec.describe Bug, type: :model do
  describe Bug do
    it "should belongs to project" do
      t = Bug.reflect_on_association(:project)
      expect(t.macro).to eq(:belongs_to)
    end
    it "should have many comments" do
      t = Bug.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end
  end 
end
