class List < ActiveRecord::Base

  belongs_to :user

  validates :user_id, presence: true

  def total_points
    total = 0
    total += movie_one_points if movie_one_points
    total += movie_two_points if movie_two_points
    total += movie_three_points if movie_three_points
    total += movie_four_points if movie_four_points
    total += movie_five_points if movie_five_points
    total += movie_six_points if movie_six_points
    total += movie_seven_points if movie_seven_points
    total += movie_eight_points if movie_eight_points
    total += movie_nine_points if movie_nine_points
    total += movie_ten_points if movie_ten_points
    total += movie_darkhorse_one_points if movie_darkhorse_one_points
    total += movie_darkhorse_two_points if movie_darkhorse_two_points
    total += movie_darkhorse_three_points if movie_darkhorse_three_points
    return total
  end
end
