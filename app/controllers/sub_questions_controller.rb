class SubQuestionsController < ApplicationController

  def edit
    @sub_question = SubQuestion.find_by(id: params[:id])
  end

  def update
    @sub_question = SubQuestion.find_by(id: params[:id])

    if @sub_question.update({question: params[:sub_question]})

      flash[:success] = "Sub-question updated!"
      redirect_to "/rfp_questions/#{@sub_question.rfp_question_id}/edit"
    else
      flash[:warning] = "Error!"
      render :edit
    end

  end

  def destroy
    @sub_question = SubQuestion.find_by(id: params[:id])
    @sub_question.update({is_active: false})

    flash[:warning] = "Question deleted"
    redirect_to "/rfp_questions"
  end

end
