require 'yaml'

module Briefing
  class Slides
    attr_reader :sections, :options

    DEFAULTS = {
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

    def initialize(filepath)
      @sections = []
      buffer = []
      File.open(filepath).read.each_line {|line|
        if line.match /^-{3,}(.*)$/
          if buffer.length > 0
            @sections << buffer.join("")
          end
          buffer = []
        else
          buffer << line
        end
      }
      @options = DEFAULTS.merge(YAML.load(@sections.shift))
    end
  end
end
