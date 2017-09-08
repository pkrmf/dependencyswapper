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
  	def dev(name)
    	Dependency::DependencySwapper.new({
			:dependency_name => name
		}).dev
  	end

  	desc "setup", "Initial setup for depswapper"
  	def setup
  		puts "Make sure to add your dependency mappings in the ~/.depswapper/depmapper.json file!"
  		`if [ ! -d ~/.depswapper ]; then
  			mkdir -p ~/.depswapper;
		fi

		if [ ! -e ~/.depswapper/depmapper.json ];then
    		touch ~/.depswapper/depmapper.json 
    		echo '{\n\t\"DependencyName\":\"git-url\"\n}' > ~/.depswapper/depmapper.json
		fi
		`
	end
   end
  end