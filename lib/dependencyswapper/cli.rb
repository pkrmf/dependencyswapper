 require "thor"
 require "dependencyswapper"

 module Dependency
   class CLI < Thor
   	desc "test FrameworkName", "Pulls the FrameworkName as source(not editable)"
   	option :exclude_repo
  	def test(name)
    	Dependency::DependencySwapper.new({
			:dependency_name => name
			#:excluded_directory => "#{options[:exclude_repo]}"
		}).run
  	end

  	desc "development FrameworkName", "Pulls the FrameworkName as development pod(editable source)"
  	option :exclude_repo
  	def dev(name)
  		puts "#{options[:exclude_repo]}"
    	Dependency::DependencySwapper.new({
			:dependency_name => name
			#:excluded_directory => "#{options[:exclude_repo]}"
		}).dev
  	end
   end
  end