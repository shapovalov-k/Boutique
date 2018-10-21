class Disc < Product
  attr_accessor :title, :artist, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |line| line.chomp }

    self.new(
        title: lines[0],
        artist: lines[1],
        genre: lines[2],
        year: lines[3],
        price: lines[4],
        amount: lines[5]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def to_s
    "Альбом  #{artist} - «#{title}», #{genre}, #{year}, #{super}"
  end
end