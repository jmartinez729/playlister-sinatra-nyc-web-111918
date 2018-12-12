class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  def slug
    artist_name = self.name.downcase
    artist_name.tr(' ', '-')
  end

  def self.find_by_slug(slug_name)
    fixed_name = slug_name.tr('-', ' ')
    self.all.find do |artist|
      artist.name.downcase == fixed_name
    end
  end

end #end of Artist class
