require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#auto-add controllers
Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |controller|
 require(controller)
end


use Rack::MethodOverride
run ApplicationController
