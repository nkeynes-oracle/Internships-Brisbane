#  @soundtrack Platform - Bewilderbeast

require 'sinatra'
require 'sinatra/namespace'

require_relative 'controllers/scss_handler'
require_relative 'controllers/internship_handler'

class InternshipApp < Sinatra::Application
  register Sinatra::Namespace
  use ScssHandler
  use InternshipHandler

  set :views, File.join(__dir__, 'client', 'views')

  get '/' do
    slim :index
  end

  not_found do
    status 404
    slim :'404', :layout => false
  end
end
