class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def show
    test_run = TestRun.find(params[:id])
    @question_number = params[:question_number].to_i

    if @question = test_run.skill_test.questions[@question_number - 1]
      @submitted_answer = test_run.submitted_answers.build question:@question, question_number:@question_number
      @time_taken = TimeDifference.between(test_run.created_at, Time.now).in_general
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end