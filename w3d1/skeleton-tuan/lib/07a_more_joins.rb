# == Schema Information
#
# Table name: albums
#
#  asin        :string       not null, primary key
#  title       :string
#  artist      :string
#  price       :float
#  rdate       :date
#  label       :string
#  rank        :integer
#
# Table name: styles
#
# album        :string       not null
# style        :string       not null
#
# Table name: tracks
# album        :string       not null
# disk         :integer      not null
# posn         :integer      not null
# song         :string

require_relative './sqlzoo.rb'

def alison_artist
  # Select the name of the artist who recorded the song 'Alison'.
  execute(<<-SQL)
  SELECT
    artist
  FROM
    albums
  JOIN
    tracks
      ON tracks.album = albums.asin
  WHERE
    song = 'Alison'
  SQL
end

def exodus_artist
  # Select the name of the artist who recorded the song 'Exodus'.
  execute(<<-SQL)
  SELECT
    artist
  FROM
    albums
  JOIN
    tracks
      ON tracks.album = albums.asin
  WHERE
    song = 'Exodus'
  SQL
end

def blur_songs
  # Select the `song` for each `track` on the album `Blur`.
  execute(<<-SQL)
  SELECT
    song
  FROM
    albums
  JOIN
    tracks
      ON tracks.album = albums.asin
  WHERE
    title = 'Blur'
  SQL
end

def heart_tracks
  # For each album show the title and the total number of tracks containing
  # the word 'Heart' (albums with no such tracks need not be shown). Order by
  # the number of such tracks.
  execute(<<-SQL)
  SELECT
    title, COUNT(*)
  FROM
    albums
  JOIN
    tracks
      ON albums.asin = tracks.album
  WHERE
    tracks.song ~'Heart'
  GROUP BY
    asin
  ORDER BY
    COUNT(*) DESC
  SQL
end

def title_tracks
  # A 'title track' has a `song` that is the same as its album's `title`. Select
  # the names of all the title tracks.
  execute(<<-SQL)
  SELECT
    song
  FROM
    tracks
  JOIN
    albums
      ON albums.asin = tracks.album
  WHERE
    tracks.song = albums.title
  SQL
end

def eponymous_albums
  # An 'eponymous album' has a `title` that is the same as its recording
  # artist's name. Select the titles of all the eponymous albums.
  execute(<<-SQL)
  SELECT
    title
  FROM
    albums
  WHERE
    title = artist
  SQL
end

def song_title_counts
  # Select the song names that appear on more than two albums. Also select the
  # COUNT of times they show up.
  execute(<<-SQL)
  SELECT
    song, COUNT(*)
  FROM
    tracks
  GROUP BY
    song
  HAVING
    COUNT(*) > 2
  SQL
end

def best_value
  # A "good value" album is one where the price per track is less than 50
  # pence. Find the good value albums - show the title, the price and the number
  # of tracks.
  execute(<<-SQL)
  SELECT
    title, price, COUNT(song)
  FROM
    albums
  JOIN
    tracks
      ON tracks.album = albums.asin
  GROUP BY
    albums.asin
  HAVING
    (albums.price/COUNT(song)) < 0.5
  SQL
end

def top_track_counts
  # Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101
  # tracks. List the top 10 albums in order of track count. Select both the
  # album title and the track count.
  execute(<<-SQL)
  SELECT
    title, COUNT(song)
  FROM
    albums
  JOIN
    tracks
      ON tracks.album = albums.asin
  GROUP BY
    asin
  ORDER BY
    COUNT(song) DESC
  LIMIT
    10
  SQL
end

def soundtrack_wars
  # Select the artist who has recorded the most soundtracks, as well as the
  # number of albums. HINT: use LIKE '%Soundtrack%' in your query.
  execute(<<-SQL)
  -- SELECT
  --   artist, COUNT(asin)
  -- FROM
  --   albums
  -- WHERE
  --   title ~ 'Soundtrack'
  -- GROUP BY
  --   artist
  -- ORDER BY
  --   COUNT(asin) DESC
  -- LIMIT
  --   1
  SQL
end

# def expensive_tastes
#   # Select the five styles of music with the highest average price per track,
#   # along with the price per track. One or more of each aggregate functions,
#   # subqueries, and joins will be required.
#   execute(<<-SQL)
#   SELECT
#     style, (price/COUNT(song))
#   FROM
#     styles
#   JOIN
#     albums
#       ON albums.asin = styles.album
#   JOIN
#     tracks
#       ON tracks.album = albums.asin
#   GROUP BY
#     style
#   ORDER BY
#     (price/COUNT(song)) DESC
#   LIMIT
#     5
  SQL
end
