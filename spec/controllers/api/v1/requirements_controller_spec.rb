require "spec_helper"

describe Api::V1::RequirementsController do
  let(:user) { create(:user) }

  describe "with valid token", validToken: true do
    #before(:each) { authWithUser(user) }

    describe "GET #index" do
      let!(:requirements) { create_list(:requirement, 10) }

      context "without id parameters" do
        before(:each) { get :index }

        it "returns all test_models" do
          expect(json['requirements'].length).to eq(10)
        end

        it "has a 200 status code" do
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
