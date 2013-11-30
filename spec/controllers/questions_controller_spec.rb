require 'spec_helper'

describe QuestionsController do

  describe "GET 'show'" do
    context 'With signed-in user' do
      let(:user) {Fabricate(:user)}
      before { sign_in user}

      before (:each) { get :show, question_number:1, id: test_run, use_route: :question_number_for_test_run }
      let(:test_run) { Fabricate(:test_run, user:user)}

      it "assigns the requested question to @question" do
        expect(assigns(:question)).to eq(test_run.skill_test.questions.first)
      end

      it "assigns the question number to question_number" do
        expect(assigns(:question_number)).to eq(1)
      end

      it "builds a submitted_answer and assigns it to @submitted_answer" do
        expect(assigns(:submitted_answer)).not_to be_nil
      end


      it "renders the :show template" do
        expect(response).to render_template(:show)
      end
    end
  end
end
