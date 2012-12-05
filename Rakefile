#!/usr/bin/env rake
require "bundler/gem_tasks"

Rake::Task[:build].enhance(['revealjs:build'])

task :clean do
  Rake::Task['revealjs:clean'].invoke
  rm_rf './pkg'
end

namespace :revealjs do
  task :build do
    sh 'git submodule update --init'
    mkdir_p './lib/briefing/public'
    ['css','js', 'lib', 'plugin'].each {|dir|
      cp_r(
        File.join('./vendor/reveal.js/', dir),
        './lib/briefing/public/')
    }
  end

  task :clean do
    rm_rf './lib/briefing/public'
    rm_rf './vendor/reveal.js'
  end
end
