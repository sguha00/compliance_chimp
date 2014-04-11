require 'spec_helper'
require 'cancan/matchers'

describe User do
  describe 'abilities' do
    subject(:ability) { Ability.new(user) }

    context 'for guest users' do
      let(:user) { User.new }
      it { should be_able_to(:index, :home) }
      it { should_not be_able_to(:read, Requirement) }
      it { should_not be_able_to(:read, User) }
    end

    context 'for registered users' do
      let(:user) { build_stubbed(:user) }
      it { should be_able_to(:index, :home) }
      it { should be_able_to(:read, Requirement) }
      it { should_not be_able_to(:read, User) }
      it { should be_able_to(:update, user) }
      it { should be_able_to(:create, Proof) }
      it { should be_able_to(:update, build_stubbed(:proof, user: user)) }
      it { should_not be_able_to(:update, build_stubbed(:proof, user: build_stubbed(:user))) }
      it { should be_able_to(:destroy, :images) }
    end

    context 'for admin users' do
      let(:user) { create(:admin) }
      it { should be_able_to(:manage, :all) }
      it { should_not be_able_to(:destroy, user) }
    end
  end
end
