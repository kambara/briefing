require 'yaml'
require 'cgi'

module Briefing
  class Slides
    attr_reader :sections, :options
    
    def initialize(filepath)
      @sections = []
      buffer = []
      File.open(filepath).read.each_line {|line|
        if line.match /^-{3,}(.*)$/
          @sections << buffer.join('') if buffer.length > 0
          buffer = []
        else
          buffer << modify_assets_path(line)
        end
      }
      @sections << buffer.join('') if buffer.length > 0
      @options = Options.new(@sections.shift) if @sections.length > 0
    end

    def modify_assets_path(line)
      ## ![](hoge.jpg)  =>  ![](assets/hoge.jpg)
      line.gsub(/!\[(.*)\]\((.+)\)/) {|matched|
        alt = $1
        path = $2
        if path.match /^https?:\/\//
          matched
        elsif path.match /^assets\//
          matched
        else
          "![#{alt}](assets/#{CGI.escape(path)})"
        end
      }
    end
  end

  class Options < Hash
    REVEALJS_DEFAULTS = {
      'controls'     => false,
      'progress'     => true,
      'history'      => true,
      'keyboard'     => true,
      'overview'     => true,
      'center'       => true,
      'loop'         => false,
      'rtl'          => false,
      'autoSlide'    => 0,
      'mouseWheel'   => false,
      'rollingLinks' => false
    }

    def initialize(yaml_text)
      if options = YAML.load(yaml_text)
        self.merge! options
      end
    end

    def revealjs
      options = {}
      REVEALJS_DEFAULTS.each_pair {|key, value|
        options[key] = self[key] || value
      }
      options
    end
  end
end
