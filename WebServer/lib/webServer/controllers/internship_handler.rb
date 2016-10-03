#  @soundtrack You Are Not Alone - Jim-E Stack

class InternshipHandler < Sinatra::Base
  register Sinatra::Namespace
  set :views, File.join(__dir__, '..', 'client', 'views')

  namespace '/internships' do
    namespace '/:name' do
      before do
        @file = nil
        solution = File.join('..', '..', '..', '..', '..', '_Internships', params[:name])
        Dir[File.join(__dir__, '..', '..', '..', '..', '_Internships', '*')].each do |file|
          if file.downcase.include? params[:name].downcase
            @file = solution
            break
          end
        end
      end

      get '/?' do
        if @file.nil?
          halt(404)
          slim 'internship/error'
        else
          slim 'internship/index'.to_sym, :locals => {:text => markdown(@file.to_sym)}
        end
      end
    end
  end
end