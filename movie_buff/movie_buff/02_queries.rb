def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie.select(:id, :title, :yr, :score).where(yr: 1980..1989, score: 3..5)

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie.select(:yr).group(:yr).having('MAX(score) < 8').pluck(:yr)

end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor.select(:id, :name).joins(:movies).where("movies.title = ?", title).order("castings.ord")
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie.select(:id, :title, "actors.name").joins(:actors)
  .where("castings.ord = 1 AND actors.id = movies.director_id")
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  
  # Kind of Random
#   Actor.select(:id, :name, "COUNT(castings.ord) AS roles")
#   .joins(:castings).where("castings.ord > 1")
#   .group(:id).limit(2).order("roles DESC")
  
  # In order of opperations of SQL
  Actor.joins(:castings).where("castings.ord > 1")
  .group("actors.id").having("")
  .select(:id, :name, "COUNT(castings.ord) AS roles")
  .order("roles DESC").limit(2)
  
  # Actor.find_by_sql(<<-SQL)
  #   SELECT actors.id, actors.name, COUNT(castings.ord) AS roles
  #   FROM 
  #     actors
  #   JOIN 
  #     castings ON actors.id = castings.actor_id
  #   WHERE castings.ord > 1
  #   GROUP BY actors.id
  #   ORDER BY roles DESC
  #   LIMIT 2
  # SQL
end
