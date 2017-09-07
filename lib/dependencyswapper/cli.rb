 require "thor"
 require "dependencyswapper"

 module Dependency
   class CLI < Thor
   		if ARGV[0].eql? "setup"
   		`if [ ! -d ~/.depswapper ]; then
  			mkdir -p ~/.depswapper;
		fi

		if [ ! -e ~/.depswapper/depmapper.json ];then
    		touch ~/.depswapper/depmapper.json 
    		echo '{\n\t\"DependencyName\":\"git-url\"\n}' > ~/.depswapper/depmapper.json
		fi

		echo "Make sure to add your dependency mappings in the ~/.depswapper/depmapper.json file!"
		`
   		else
   			Dependency::DependencySwapper.new({
				:dependency_name => ARGV[0]
			}).run
   		end
   end
  end