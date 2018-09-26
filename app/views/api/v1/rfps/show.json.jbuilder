json.id @rfp.id
json.user_id @rfp.user_id

json.array! @rfp_sections.each do |rfp_section|
  json.rfp_section rfp_section.name

  json.rfp_questions rfp_section.rfp_questions.each do |rfp_question|
    json.rfp_question rfp_question.question
    json.is_active rfp_question.is_active
    json.question_type rfp_question.question_type
    json.question_id rfp_question.id
    json.word_limit rfp_question.word_limit

    @rfp.rfp_answers.each do |rfp_answer|

      if rfp_answer.rfp_question_id == rfp_question.id

        if rfp_question.question_type == 'multiple input'
          json.rfp_answers @rfp.rfp_answers.each do |multiple_answer|
            if multiple_answer.rfp_question_id == rfp_question.id
              json.rfp_answer multiple_answer.answer
              json.rfp_answer_id multiple_answer.id
            end
          end
        else
          json.rfp_answer rfp_answer.answer
        end

        if rfp_answer.sub_answers.length > 0

          if rfp_question.question_type == 'block with multiple inputs'

            json.sub_questions rfp_question.sub_questions.each do |sub_question|
              json.sub_question sub_question.question
              json.sub_question_id sub_question.id
              json.sub_answers rfp_answer.sub_answers.each do |sub_answer|
                if sub_question.id == sub_answer.sub_question_id
                  json.sub_answer sub_answer.answer
                  json.sub_answer_id sub_answer.id
                end
              end
            end

          else
            json.sub_questions rfp_answer.sub_answers.each do |sub_answer|
              json.sub_question sub_answer.sub_question.question
              json.sub_question_id sub_answer.sub_question.id
              json.sub_answer sub_answer.answer
            end
          end

        end


      end
    end

  end
end
