require 'spec_helper'

describe SkillTestsController do

  describe "GET 'show'" do
    let(:skill_test) { Fabricate(:skill_test)}
    context 'With signed-in user' do
      before { sign_in Fabricate(:user)}
      before (:each) { get :show, id: skill_test }

      it "assigns the requested skill_test to @skill_test" do
        expect(assigns(:skill_test)).to eq(skill_test)
      end

      it "renders the :show template" do
        expect(response).to render_template(:show)
      end
    end
  end
end
