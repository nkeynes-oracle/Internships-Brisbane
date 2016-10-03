require 'sinatra'

class InternshipApp < Sinatra::Application
  get '/' do
    'Hello World'
  end
end
