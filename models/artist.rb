require_relative('../db/sql_runner')
require_relative('./exhibtion')

class Artist

  attr_accessor :id, :alias

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @alias = options['alias']
  end

  def save()
    sql = "INSERT INTO artitsts (alias) VALUES ($1) RETURNING id"
    values = [@alias]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def delete()
    sql = "DELETE FROM artists
    WHERE id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).firt
    artist = Artist.new(result)
    return artist
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist_data = SqlRunner.run(sql)
    artists = artist_data.map { |artist| Artist.new(artist) }
    return artists
  end

  def exhibtion()
    exhibtion = Exhibition.find(@exhibition_id)
  end

end
