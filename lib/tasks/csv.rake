require 'csv'

namespace :csv do
  desc "Import cities from CSV file"
  task seed_cities: :environment do
    csv_file_path = 'db/cities.csv'
    CSV.foreach(csv_file_path) do |row|
        City.create!({
            arabic_name: row[0],
            english_name: row[1],
            longitude: row[2],
            latitude: row[3,]
        })
    end
  end

end
