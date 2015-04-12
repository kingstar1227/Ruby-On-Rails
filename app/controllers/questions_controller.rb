class QuestionsController < ApplicationController

  before_action :set_question, only: [:show]

  def create
    @question = Question.generate(vocable_id: questions_params[:id])
    redirect_to questions_path @question
  end

  def show

  end

  private
    def questions_params
      params.require(:vocable).permit(:id)
    end

    def set_question
      @question = Question.find(params[:id])
    end


end
