namespace :signups do
  desc "Count the current signups"
  task :count => :environment do    
    puts "#{Preuser.count}"
  end
  
  desc "List the current signups"
  task :list => :environment do  
    Preuser.all.each do |signup|
      puts signup.email
    end
  end

end