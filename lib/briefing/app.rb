require 'sinatra/base'
require 'sinatra/reloader'
require 'briefing/slides'

module Briefing
  class App < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
      dir = File.dirname(__FILE__)
      set :public_folder, File.join(dir, 'public')
      set :views, File.join(dir, 'views')
    end

    get '/' do
      @slides = Slides.new(settings.slides_source)
      @options = @slides.options
      erb :index
    end
  end
end
