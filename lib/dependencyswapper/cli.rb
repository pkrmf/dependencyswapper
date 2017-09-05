 require "thor"
 require "dependencyswapper"

 module Dependency
   class CLI < Thor
     desc "ipsum", "Lorem Ipsum text generator"
       def ipsum
         puts Lorem.ipsum
     end
   end
  end