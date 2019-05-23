class Song < ApplicationRecord

  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year],
    message: "Cannot be repeated by the same artist in the same year" }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released
  end
  #
  # validates :release_year, :presence => false, :if => :released_is_false?
  #
  # private
  #
  # def released_is_false?
  #    released == false
  # end

end
