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
    quiz = Quiz.find(check_params[:quiz_id])
    @unit = quiz.unit
    @result = 0
    user_answers = check_params[:answers]
    if(user_answers)
      check_answers(user_answers, check_params[:quest_ids])
    else
      raise "Your committed data is broken"
      redirect_to quiz_path @quiz
    end
  end



  private
    def quiz_params
      params.require(:unit).permit(:id,:name)
    end

    def check_params
      params.require(:content).permit! #(:quiz_id, answers: [], quest_ids: [])
    end

    def check_answers(answers, quest_ids)
      answers.each do | key, user_answer|
        quest = Question.find(quest_ids[key])
        @result = @result + 1 if user_answer == quest.answer
      end
    end

end
