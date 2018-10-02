class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :loi

  validates :q1, :q2, :q3, presence: true
  validates :q1, :q2, :q3, numericality: true
  validates :loi_id, uniqueness: {scope: :user_id, message: "You've already submitted a rating this Letter of Interest. Please refresh the page to 'Edit' your rating."}

	def weighted_score
		total = q1 + (q2 * 2) + q3
		total/4.to_f
	end

  def self.to_csv
    attributes = %w{id org_name q1 q2 q3 q5 weighted_score comment rated_by}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |rating|
        csv.add_row([
          rating.id,
          rating.loi.org_name,
          rating.q1,
          rating.q2,
          rating.q3,
          rating.q4,
          rating.q5,
          rating.weighted_score,
          rating.comment,
          rating.user.email
          ])
      end
    end
  end
end
