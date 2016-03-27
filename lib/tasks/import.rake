require 'csv'

desc "Imports a CSV file into an ActiveRecord table"
task :import, [:goal_templates] => :environment do    
    CSV.foreach('goal_templates.csv', :headers => true) do |row|
      GoalTemplate.create!(row.to_hash)
    end
end

