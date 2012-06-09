namespace :signups do
  task :list => :environment do
    desc "List the current signups"
    puts "#{Preuser.count} signups"
    puts "---"
    Preuser.all.each do |signup|
      puts signup.email
    end
  end

  task :count => :environment do
    desc "List the current signups"
    puts "#{Preuser.count}"
    puts "---"
    Preuser.all.each do |signup|
      puts signup.email
    end
  end

end