# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Created models and tables according to the domain model.

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Insert data into the database for studios.

puts "There are #{Studio.all.count} studios."
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save
puts "There are #{Studio.all.count} studios."

# Insert data into the database for movies.

puts "There are #{Movie.all.count} movies."

warner_bros = Studio.find_by({"name" => "Warner Bros."})

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["rated"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

puts "There are #{Movie.all.count} movies."

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008 # should this be in "" or not
movie["rated"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

puts "There are #{Movie.all.count} movies."

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["rated"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

puts "There are #{Movie.all.count} movies."

# Insert data into the database for actors and roles.

# Batman Begins
batman_begins = Movie.find_by({"title" => "Batman Begins"})

puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Christian Bale"
actor.save
puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save
puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save
puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save
puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save
puts "There are #{Actor.all.count} actors."

christian_bale = Actor.find_by({"name" => "Christian Bale"})
michael_caine = Actor.find_by({"name" => "Michael Caine"})
liam_neeson = Actor.find_by({"name" => "Liam Neeson"})
katie_holmes = Actor.find_by({"name" => "Katie Holmes"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})

puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = michael_caine["id"]
role["character_name"] = "Alfred"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = liam_neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = katie_holmes["id"]
role["character_name"] = "Rachel Dawes"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = gary_oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save
puts "There are #{Role.all.count} roles."

# Dark Knight
dark_knight = Movie.find_by({"title" => "The Dark Knight"})

puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save
puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save
puts "There are #{Actor.all.count} actors."

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save
puts "There are #{Actor.all.count} actors."

heath_ledger = Actor.find_by({"name" => "Heath Ledger"})
aaron_eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
maggie_gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})

puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = heath_ledger["id"]
role["character_name"] = "Joker"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = aaron_eckhart["id"]
role["character_name"] = "Harvey Dent"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = michael_caine["id"]
role["character_name"] = "Alfred"
role.save
puts "There are #{Role.all.count} roles."

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = maggie_gyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role.save
puts "There are #{Role.all.count} roles."

# Dark Knight Rises
dark_knight_rises = Movie.find_by({"title" => "Dark Knight Rises"})


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
