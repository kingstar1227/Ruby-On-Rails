class QuizzesController < ApplicationController
  def create
    @quiz = Quiz.create(unit_id: quiz_params[:id])

    @quiz.fetchQuestions()
    @quiz.save

    redirect_to quiz_path @quiz

  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  private
    def quiz_params
      params.require(:unit).permit(:id,:name)
    end

end
