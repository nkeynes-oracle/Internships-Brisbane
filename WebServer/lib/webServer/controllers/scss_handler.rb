#  @soundtrack In Your Bones (Chiefs Remix) - Crooked Colours

class ScssHandler < Sinatra::Base
  set :views, File.join(__dir__, '..', 'client', 'scss')

  get '/css/*.css' do
    scss params[:splat].first.to_sym
  end
end