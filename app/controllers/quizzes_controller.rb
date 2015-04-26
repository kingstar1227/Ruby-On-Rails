class QuizzesController < ApplicationController
  def create
    @quiz = Quiz.create(unit_subscription_id: quiz_params[:id])

    @quiz.fetchQuestions()
    @quiz.save

    redirect_to quiz_path @quiz
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def check
    quiz_id = check_params[:quiz_id]
    user_answers = check_params[:answers]
    if Quiz.exists?(quiz_id) and user_answers && check_params[:quest_ids]
      @question_count = user_answers.length
      @quiz = Quiz.find(quiz_id)
      unit = @quiz.unit_subscription.unit
      check_answers(user_answers, check_params[:quest_ids])
      if @quiz.unit_subscription.score
        @quiz.unit_subscription.update(score: @quiz.unit_subscription.score+  (@result / @question_count * 20).to_i)
      else
        @quiz.unit_subscription.update(score: (@result / @question_count * 20).to_i)
      end
    else
      redirect_to :unit_subscriptions
      flash[:notice] = "Internal Error"
    end
  end

  private
    def quiz_params
      params.require(:unit_subscription).permit(:id,:unit_id,:user_id)
    end

    def check_params
      params.require(:content).permit! #(:quiz_id, answers: [], quest_ids: [])
    end

    def check_answers(answers, quest_ids)
      @result = 0
      @failures = []
      answers.each do | key, user_answer|
        quest = Question.find(quest_ids[key])
        if user_answer == quest.answer
          @result = @result + 1
        else
          @failures << {question: quest.question, user_answer: user_answer, right_answer: quest.answer}
        end
      end
    end

end
