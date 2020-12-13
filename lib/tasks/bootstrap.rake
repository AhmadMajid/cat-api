 namespace :bootstrap do
      desc "Add the default cat"
      task :default_cat => :environment do
        Cat.create( :name => 'Snowy the cat', :sex => 'female', :colour => 'white', :favouritefood => 'dominos garlic sauce' )
      end

      desc "Create the default collection"
      task :default_collection => :environment do
        Collection.create( :title => 'Cat Collection')
      end

      desc "Run all bootstrapping tasks"
      task :all => [:default_cat, :default_collection]
    end
