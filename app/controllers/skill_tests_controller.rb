class SkillTestsController < ApplicationController

  def show
    @skill_test = SkillTest.find(params[:id])
    @test_run = TestRun.new skill_test:@skill_test
  end

end
