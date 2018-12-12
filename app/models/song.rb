class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    song_name = self.name.downcase
    song_name.tr(' ', '-')
  end

  def self.find_by_slug(slug_name)
    fixed_name = slug_name.tr('-', ' ')
    self.all.find do |song|
      song.name.downcase == fixed_name
    end
  end

end #end of Song class
