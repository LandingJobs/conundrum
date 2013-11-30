require 'spec_helper'

describe TestRunsController do

  describe "POST 'create'" do
    let (:skill_test) { Fabricate(:skill_test) }
    context "with a logged in user" do
      before { sign_in Fabricate(:user) }
      context "with valid attributes" do
        it "creates a new test_run" do
          expect{ post :create, test_run: Fabricate.attributes_for(:test_run, skill_test:skill_test) }.to change(TestRun,:count).by(1)
        end
        it "redirects to the first question" do
          post :create, test_run:Fabricate.attributes_for(:test_run, skill_test:skill_test)
          expect(response).to redirect_to question_number_for_test_run_path(TestRun.last, 1)
        end
      end
      context "with inexistent skill_test" do
        it "raises" do
          expect{ post :create, test_run: {skill_test_id: 99} }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end

  describe "GET 'show'" do
    context "with a logged in user" do
      let(:user) {Fabricate(:user)}
      before { sign_in user}

      before (:each) { get :show, id: test_run }
      let(:test_run) { Fabricate(:finished_test_run, user: user)}

      it "assigns the requested test_run to @test_run" do
        expect(assigns(:test_run)).to eq(test_run)
      end

      it "renders the :show template" do
        expect(response).to render_template(:show)
      end
    end
  end
end
