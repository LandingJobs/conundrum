class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def show
    test_run = current_user.test_runs.find(params[:id])
    @question_number = params[:question_number].to_i

    if @question_number != test_run.submitted_answers.count+1
      redirect_to question_number_for_test_run_path(test_run, test_run.submitted_answers.count+1)
    end

    if @question = test_run.skill_test.questions[@question_number - 1]
      @submitted_answer = test_run.submitted_answers.build question:@question, question_number:@question_number
      @time_taken = TimeDifference.between(test_run.created_at, Time.now).in_general
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end