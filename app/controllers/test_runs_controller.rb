class TestRunsController < ApplicationController
  before_filter :authenticate_user!

  def create
    skill_test = SkillTest.find params[:test_run][:skill_test_id]
    @test_run = skill_test.test_runs.build
    if @test_run.save
      redirect_to question_number_for_test_run_path(@test_run, 1)
    end
  end

  def update
    @test_run = TestRun.find(params[:id])

    if @test_run.update_attributes(email: params[:test_run][:email])
      UserResultsMailJob.new.async.perform(@test_run.id)
      redirect_to test_run_path @test_run
    else
      render 'finish'
    end
  end

  def show
    @test_run = TestRun.find(params[:id])
    redirect_to finish_test_run_path(@test_run) if @test_run.email.nil?
  end

  def finish
    @test_run = TestRun.find(params[:id])
  end

  private

  def test_run_params
    params.require(:test_run).permit(:skill_test_id)
  end
end
