require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
#might need Rack:Flash or Sinatra-flash

run ApplicationController
use InkControllersController
use PenControllersController
use UserControllersController
