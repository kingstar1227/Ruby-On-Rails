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

  def check
    quiz = Quiz.find(params[:quiz_id])
    @unit = quiz.unit
    @result = 0



    params[:answers].each do |quest_id, user_answer|
     quest = Question.find(quest_id)
     @result = @result + 1 if user_answer == quest.answer
    end
  end





  private
    def quiz_params
      params.require(:unit).permit(:id,:name)
    end

    def check_params
    end


end
