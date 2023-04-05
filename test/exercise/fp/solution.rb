module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select { |film| film['country']&.include?(',') && film['rating_kinopoisk'].to_f.positive? }

        films_ratings = filtered_films.map { |film| film['rating_kinopoisk'].to_f }

        return 0 if films_ratings.empty?

        total_rating = films_ratings.reduce(:+)

        total_rating / films_ratings.size
      end

      def chars_count(_films, _threshold)
        0
      end
    end
  end
end
