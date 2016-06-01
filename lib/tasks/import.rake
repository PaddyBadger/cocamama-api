require 'csv'

desc "Imports goal_templates and icon files into an ActiveRecord table"
task :import_templates_and_icons, [:goal_templates] => :environment do    
    CSV.foreach('goal_templates.csv', :headers => true) do |row|
      GoalTemplate.create!(row.to_hash)
    end
    CSV.foreach('icons.csv', :headers => true) do |row|
      Icon.create!(row.to_hash)
    end
end

