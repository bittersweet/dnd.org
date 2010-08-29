require 'yaml'

# Backup script for a MySQL database
# Cheers to Derek Perez 
# http://github.com/perezd/heroku_tools/blob/master/backup.rake

namespace :backups do
  desc "dump db and send to s3"
  task :backup => :environment do

    APP_NAME = "dnd"
    DB_CONFIG = YAML::load(ERB.new(IO.read(File.join(RAILS_ROOT, 'config', 'database.yml'))).result)[RAILS_ENV]

    backup_started = Time.now
    puts "Backup started at #{backup_started}"

    puts "Dumping SQL..."

    backup_name = "#{APP_NAME}_#{Time.now.to_s(:number)}.sql"
    backup_path = "tmp/#{backup_name}"

    `mysqldump -u#{DB_CONFIG['username']} #{DB_CONFIG['database']} > #{backup_path}`

    puts "Gzipping sql file..."
    `gzip #{backup_path}`

    backup_name += ".gz"
    backup_path = "tmp/#{backup_name}"

    backup_finished = Time.now
    puts "Backup completed at #{backup_finished}"
    puts "took #{backup_finished - backup_started} seconds"
  end

end
