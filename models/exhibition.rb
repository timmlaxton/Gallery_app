require_relative('../db/sql_runner')
require_relative('./artist')

class Exhibtition

  attr_reader :id, :title, :catergory, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @catergory = options['catergory']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO exhibtions (title, catergory, artis_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @catergory, @artist_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE exhibtions SET (title, catergory, artis_id) VALUES ($1, $2, $3) WHERE id = $4"
    va;ues = [@title, @catergory, @artist_id, @id]
    SqlRunner.run( sql, values)
  end

  def delete()
    sql = "DELETE FROM exhibitions
    WHERE ID = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT *FROM exhibitions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    exhibition = Exhibition.new(result)
    return exhibition
  end

  def self.filter_by_catergory(catergory)
    sql = "SELECT * FROM exhibitions
    WHERE catergory = $1"
    values = [catergory]
    filtered_data = SqlRunner.run(sql, values)
    filtered_exhibitions = filtered_data.map { |exhibition| Exhibition.new(exhibition) }
    return filtered_exhibitions
  end

  def self.all()
    sql = "SELECT * FROM exhibitions"
    exhibition_data = SqlRunner.run(sql)
    exhibitions = exhibition_data.map { |exhibition| Exhibtion.new(exhibition) }
    return exhibitions
  end


  def artists()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)
    result = Artist.new (artist.first)
    return result
  end

  def self.filter_by_artists(test)
    sql = "SELECT * FROM exhibtions JOIN artists
    ON exhibtions.artist_id = artists.id
    WHERE artists.alias LIKE '%' || $1 || '%';"
    values = [test]
    filtered_data = SqlRunner.run(sql, values)
    filtered_exhibitions = filtered_data.map { |exhibtion| Exhibtion.new(exhibtion) }
    return filtered_exhibtions
  end

end
