 require "thor"
 require "dependencyswapper"

 module Dependency
   class CLI < Thor
   	desc "test FrameworkName", "Pulls the FrameworkName as source(not editable)"
  	def test(name)
    	Dependency::DependencySwapper.new({
			:dependency_name => name
		}).run
  	end

  	desc "development FrameworkName", "Pulls the FrameworkName as development pod(editable source)"
  	option :exclude_repo
  	def dev(name)
    	Dependency::DependencySwapper.new({
			:dependency_name => name
		}).dev
  	end
   end
  end