class TestRunsController < ApplicationController
  before_filter :authenticate_user!

  def create
    skill_test = SkillTest.find params[:test_run][:skill_test_id]
    @test_run = skill_test.test_runs.build do |t|
      t.user = current_user
    end
    if @test_run.save
      redirect_to question_number_for_test_run_path(@test_run, 1)
    end
  end

  def show
    @test_run = current_user.test_runs.find(params[:id])
    if @test_run.finished_at.nil?
      redirect_to question_number_for_test_run_path(@test_run, @test_run.submitted_answers.count+1)
    end
  end

  private

  def test_run_params
    params.require(:test_run).permit(:skill_test_id)
  end
end
