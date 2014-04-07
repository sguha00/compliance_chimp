require 'spec_helper'

describe Requirement do
  describe '.complete_and_incomplete_series' do
    let(:user)         { create(:user) }
    let(:other_user)   { create(:user) }
    let(:requirement1) { create(:requirement) }
    let(:requirement2) { create(:requirement) }
    let(:requirement3) { create(:requirement) }
    let(:requirement4) { create(:requirement) }

    before do
      6.times do
        create(:requirement)
      end
      create(:proof, user: user, requirement: requirement1)
      create(:proof, user: user, requirement: requirement2)
      create(:proof, user: user, requirement: requirement3)
      create(:proof, user: user, requirement: requirement4)
      create(:proof, user: other_user, requirement: requirement1)
    end
    it 'should return an array of complete and incomplete requirements counts for a given user' do
      expect(Requirement.completed_and_incompleted_for(user)).to eq([['Complete', 40], ['Incomplete', 60]])
    end
    it 'should not include other users proofs in the count' do
      expect(Requirement.completed_and_incompleted_for(other_user)).to eq([['Complete', 10], ['Incomplete', 90]])
    end
  end
end
