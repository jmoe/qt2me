namespace :signups do
  desc "List the current signups"
  task :list => :environment do
    Preuser.all.each do |signup|
      puts signup.email
    end
  end
end