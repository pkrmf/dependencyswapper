require "dependencyswapper/pod.rb"
require "dependencyswapper/stringextractor.rb"
require 'fileutils'
require 'tempfile'

#This class generates the dependency graph by retrieving its Pod with its dependencies
module Dependency
	class Graph
		attr_reader :podfilelock_path

		def self.perform(options)
			new(options).perform
		end

		def initialize(options)
			@podfilelock_path = options.fetch(:podfilelock_path)
			@pods = Array.new()
			if !File.exist?(@podfilelock_path)
				puts "The Podfile.lock is missing. We will run pod install so we can generate the dependency graph to swap dependencies."
				system("pod install")
			end
		end

		def generate
			pod = nil

			#Read line by line the Podfile.lock
			IO.readlines(@podfilelock_path).each do |line|
				#If we are generating the depdency map of a pod, and we have a pod,
				# and the line includes a depdendency(we know cause there is a parenthesis determining a version in it),
				# then we add the dependency name to the pod.dependencies
				 if pod && (line.include?("=") || line.include?("~"))
				 	dependency = line.string_between_markers("- ", " (")
					pod.dependencies.push(dependency)
				 end

				 #At this point we found a Pod, lets build it and add its dependencies to it. We know we found a pod since
				 #the podfile.lock will show only the version.
	 			 unless line.include?("=") || line.include?("~")
	 			 	# We are going to generate a new pod but we are carrying one already, we will push it to the pods array first before we clear the variable with a new pod.
	 			 	if pod != nil
	 			 		@pods.push(pod)
	 			 	end
	 			 	name = line.string_between_markers("- ", " (")
	 			 	version = line.string_between_markers("(", ")")
	 			 	pod = Dependency::Pod.new({
	 			 			:name => name,
	 			 			:version => version
	 			 	})
	 			 end

	 			 unless line.include?("(") || line.include?(":")
	 			 	return @pods
	 			 end
			end
			return @pods
		end

	end
end
