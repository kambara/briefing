require 'sinatra/base'
require 'sinatra/reloader'
require 'briefing/slides'
require 'pathname'

module Briefing
  class App < Sinatra::Base
    configure do
      set :briefing_dir, Pathname(File.dirname(__FILE__))
      set :public_folder, briefing_dir + 'public'
      set :views, briefing_dir + 'views'
    end

    configure :development do
      register Sinatra::Reloader
      also_reload(briefing_dir + 'slides.rb')
    end

    get '/' do
      @slides = Slides.new(settings.slides_source)
      @options = @slides.options
      erb :index
    end

    get '/assets/:file.:ext' do |file, ext|
      content_type ext
      slides_file = Pathname(File.join(Dir::pwd, settings.slides_source))
      send_file(slides_file.dirname + 'assets' + "#{file}.#{ext}")
    end
  end
end
