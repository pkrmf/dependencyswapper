 require "thor"
 require "dependencyswapper"

 module Dependency
   class CLI < Thor
   		Dependency::DependencySwapper.new({
			:dependency_name => ARGV[0]
		}).run
   end
  end