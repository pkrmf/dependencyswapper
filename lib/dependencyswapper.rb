require "dependencyswapper/version"
require "dependencyswapper/DependencyReplacer.rb"
require "dependencyswapper/DependencyMapper.rb"

dependency_name = ARGV[0]
Dependency::DependencyReplacer.new({
		:dependency_name => dependency_name
	}).run