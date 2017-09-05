require "dependencyswapper/version"
#require "dependencyswapper/DependencySwapper.rb"
require "dependencyswapper/DependencyReplacer.rb"
require "dependencyswapper/DependencyMapper.rb"

module Dependency
	class DependencySwapper
		attr_reader :dependency_name

		def self.perform(options)
			new(options).perform
		end

		def initialize(options)
			@dependency_name = options.fetch(:dependency_name)
		end

		def run
			Dependency::DependencyReplacer.new({
				:dependency_name => @dependency_name
			}).run
		end
	end
end