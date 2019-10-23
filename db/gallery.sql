DROP TABLE exhibitions;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL8 primary key,
  alias VARCHAR(255)
);

CREATE TABLE exhibitions (
  id SERIAL8 primary key,
  alias VARCHAR(255),
  catergory VARCHAR(255),
  artist_id INT8 REFERENCES artists(id)
);
