class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres

  def slug
    genre_name = self.name.downcase
    genre_name.tr(' ', '-')
  end

  def self.find_by_slug(slug_name)
    fixed_name = slug_name.tr('-', ' ')
    self.all.find do |genre|
      genre.name.downcase == fixed_name
    end
  end

end #end of Genre class
