class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :artist_repeat_song_same_year

  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end
  validates :artist_name, presence: true

  def artist_repeat_song_same_year
    !Song.find_by(artist_name: self.artist_name, title: self.title, release_year: self.release_year) || errors.add(:title, "artist cannot repeat song in same year")
  end

end
