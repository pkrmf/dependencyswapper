#!/usr/bin/env ruby

#Add your dependencies to the dependency_replacements. Before the arrow make sure to add the pod name, after the arrow its git repo.
module Dependency
    class DependencyMapper
        attr_reader :dependency_replacements

        def self.perform(options)
            new(options).perform
        end

        def initialize(options)
            @dependency_replacements = {
                "ExampleFramework" => "git@bitbucket.org:myexample/example.git",
                "ExampleFramework2" => "git@bitbucket.org:myexample/example2.git",
                "ExampleFramework3" => "git@bitbucket.org:myexample/example3.git",
                "ExampleFramework4" => "git@bitbucket.org:myexample/example4.git"
            }
        end
    end
end
