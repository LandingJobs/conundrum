require 'spec_helper'

describe SubmittedAnswersController do

  describe "POST 'create'" do
    context "with a logged in user" do
      let(:user) {Fabricate(:user)}
      before { sign_in user}
      context "when not at last question" do
        before (:each) { post :create, test_run_id: test_run,
          submitted_answer: {
              test_run_id:test_run,
              question_number:1,
                 answer_ids:[test_run.skill_test.questions.first.answers.where(is_correct:true).to_a]
               }
             }
        let(:test_run) { Fabricate(:test_run, user:user)}

        it "assigns the requested question to @question" do
          expect(assigns(:question)).to eq(test_run.skill_test.questions.first)
        end

        it "creates a new submitted_answer" do
          expect(assigns(:sa).persisted?).to be_true
        end

        it "calculates max score for the question" do
          expect(assigns(:sa).max_score).to eq test_run.skill_test.questions.first.answers.where(is_correct:true).count
        end

        it "calculates score for the answer" do
          expect(assigns(:sa).score).to eq test_run.skill_test.questions.first.answers.where(is_correct:true).count
        end

        it "redirects to the next question" do
          expect(response).to redirect_to question_number_for_test_run_path(TestRun.last, 2)
        end
      end

      context "when at last question", job:true do
        before (:each) { post :create, test_run_id: test_run,
        submitted_answer: {
            test_run_id:test_run,
            question_number:1,
               answer_ids:[test_run.skill_test.questions.first.answers.first]
             }
           }
        before (:each) { test_run.reload }
        let(:test_run) { Fabricate(:test_run, skill_test:Fabricate(:single_question_skill_test), user:user)}

        it "sets the finished_at timestamp" do
          expect(test_run.finished_at).not_to be nil
        end

        it "calculates the score" do
          expect(test_run.score).not_to be nil
        end
      end
    end
  end

end
