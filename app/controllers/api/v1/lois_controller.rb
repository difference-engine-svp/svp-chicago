class Api::V1::LoisController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:index, :update, :create]
  before_action :authenticate_user!, only: [:new, :show, :update]
  before_action :authenticate_admin!, only: [:index, :destroy]

  def loi_submitted_email_to_admin
    @loi = Loi.find_by(user_id: current_user.id)
  end

  def index
  	@lois = Loi.where(submitted: true)
    @invited_lois = InvitedLoi.all
  end

  def create
    errors = []

    @loi = Loi.new({name: params[:name], email: params[:email], submitted: params[:submitted], user_id: current_user.id})

    if @loi.save

      params[:contact_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?

      end

      params[:organization_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?
      end

      params[:overview_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?
      end

      params[:vision_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?
      end

      params[:concern_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?
      end

      params[:challenge_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: "CHALLENGE")

        Fte.create(answer_id: answer.id, amount_1: answer_hash[:fte_1], amount_2: answer_hash[:fte_2], amount_3: answer_hash[:fte_3])

        answer_hash[:challenges].each do |challenge|
          Challenge.create(answer_id: answer.id, challenge: challenge[:challenge], priority: challenge[:priority])
        end
      end

      params[:referral_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?
      end

      params[:demographic_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?
      end

      params[:geographic_answers].each do |answer_hash|
        answer = Answer.create(loi_id: @loi.id, question_id: answer_hash[:question_id], answer: answer_hash[:answer])
        errors << answer.question.question if !answer.valid?
      end

      if @loi.submitted
        Mail.new( 
          :to => @loi.email, 
          :from => 'colleen@svpchicago.org', 
          :subject => 'Submission to SVP received', 
          :body => File.read('app/views/submission_email.html.erb'),
          :content_type => 'text/html; charset=UTF-8'
        ).deliver!

        Mail.new( 
          :to => 'paulyk1983@gmail.com', 
          :from => 'svptesting1871@gmail.com', 
          :subject => 'A letter of interest has been submitted', 
          :body => File.read('app/views/lois/loi_submitted_email_to_admin.html.erb'),
          :content_type => 'text/html; charset=UTF-8'
        ).deliver!        
      end

      if errors.empty?
        render json: { message: "Loi Created", loi_id: @loi.id }, status: 200
      else
        render json: {errors: errors}, status: 422
      end
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end

  end

  def show
  	@loi = Loi.find(params[:id])
    @invited_loi = InvitedLoi.find_by(loi_id: @loi.id)
    @contact_answers = []
    @organization_answers = []
    @overview_answers = []
    @vision_answers = []
    @concern_answers = []
    @challenge_answers = []
    @referral_answers = []
    @demographic_answers = []
    @geographic_answers = []


    @loi.answers.each do |answer|
      if answer.question.section.name == "Contact Information"
        @contact_answers << answer
      elsif answer.question.section.name == "Organization"
        @organization_answers << answer
      elsif answer.question.section.name == "Overview and Mission"
        @overview_answers << answer
      elsif answer.question.section.name == "Vision"
        @vision_answers << answer
      elsif answer.question.section.name == "Key Concerns"
        @concern_answers << answer
      elsif answer.question.section.name == "Organizational Capacity Challenges"
        @challenge_answers << answer
      elsif answer.question.section.name == "Referral Source"
        @referral_answers << answer
      elsif answer.question.section.name == "Demographics"
        @demographic_answers << answer
      elsif answer.question.section.name == "Geographic Focus"
        @geographic_answers << answer
      end
    end

  end

  def update
    @loi = Loi.find(params[:id])

    if @loi.update(name: params[:name], email: params[:email], submitted: params[:submitted])

      params[:contact_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      params[:organization_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      params[:overview_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      params[:vision_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      params[:concern_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      params[:challenge_answers].each do |answer_hash|

        answer = Answer.find(answer_hash[:id])

        answer.fte.update(amount_1: answer_hash[:fte][:amount_1], amount_2: answer_hash[:fte][:amount_2], amount_3: answer_hash[:fte][:amount_3])

        answer_hash[:challenges].each do |challenge|
          if challenge[:id]
            new_challenge = Challenge.find(challenge[:id])
            new_challenge.update(challenge: challenge[:challenge], priority: challenge[:priority])
          else
            Challenge.create(answer_id: answer.id, challenge: challenge[:challenge], priority: challenge[:priority])
          end
        end
      end

      params[:referral_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      params[:demographic_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      params[:geographic_answers].each do |answer_hash|
        answer = Answer.find(answer_hash[:id])
        answer.update(answer: answer_hash[:answer])
      end

      if @loi.submitted
        Mail.new( :to => @loi.email, :from => 'colleen@svpchicago.org', :subject => 'Submission to SVP received', :body => File.read('app/views/submission_email.html.erb')).deliver!
      end

      render json: { message: "Loi Updated", loi_id: @loi.id }, status: 200
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end

  end
end
