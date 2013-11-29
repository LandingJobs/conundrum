class SubmittedAnswersController < ApplicationController
  before_filter :authenticate_user!

  def create
    test_run = current_user.test_runs.find(params[:test_run_id])
    question_number = params[:submitted_answer][:question_number].to_i
    @question = test_run.skill_test.questions[question_number-1]

    @sa = test_run.submitted_answers.build do |sa|
      sa.question = @question
      sa.question_number = question_number
    end

    calculate_answer_score(params[:submitted_answer][:answer_ids])

    if @sa.save
      if question_number == test_run.skill_test.questions.count

        test_run.score = test_run.submitted_answers.inject(0) { |res,x| res += (x.score.fdiv x.max_score) } / test_run.skill_test.questions.count * 100
        test_run.finished_at = Time.now
        test_run.save
        InternalResultsMailJob.new.async.perform(test_run.id)

        redirect_to test_run_path(test_run)
      else
        redirect_to question_number_for_test_run_path(test_run, question_number+1)
      end
    else
      redirect_to question_number_for_test_run_path(test_run, test_run.submitted_answers.count+1)
    end
  end

  private

  def calculate_answer_score(a_ids)
    @sa.max_score = @question.answers.where(is_correct: true).count

    wrong_answers = @question.answers.where(id: a_ids, is_correct: false)
    @sa.wrong_answers = wrong_answers.map(&:answer_text).join(';')

    @sa.score = wrong_answers.any? ? 0 : @question.answers.where(id: a_ids, is_correct: true).count
  end
end
