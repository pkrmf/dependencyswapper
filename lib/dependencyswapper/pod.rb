#This class is a model for the Pod
module Dependency
	class Pod
		attr_reader :name, :version, :dependencies

		def self.perform(options)
			new(options).perform
		end

		def initialize(options)
			@name = options.fetch(:name)
			@version = options.fetch(:version)
			@dependencies = Array.new
		end
	end
end
