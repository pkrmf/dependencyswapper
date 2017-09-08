#!/usr/bin/env ruby
require 'fileutils'
require 'tempfile'
require 'json'

module Dependency
	class DependencyReplacer
		attr_reader :dependency_name

		def self.perform(options)
			new(options).perform
		end

		def initialize(options)
			@dependency_name = options.fetch(:dependency_name)
			@podfile_path = "Podfile"
			if !File.exist?(@podfile_path)
				abort("Cannot find the podfile. Make sure to run depswapper where your Podfile exists!")
			end
		end

		def run

			file_lines = ''
			file = File.read("#{Dir.home}/.depswapper/depmapper.json")
			dependency_replacements = JSON.parse(file)

			IO.readlines(@podfile_path).each do |line|
	 			 file_lines += line unless line.include? "'" + dependency_name + "'"
	 			 if line.include? "'" + dependency_name + "'"
	 			 	# We will look at the DependencyMapper to map each Framework with its git repository.
	 			 	remote_url = dependency_replacements[dependency_name]
	 			 	if remote_url.to_s.empty?
  						puts "You are missing the dependency mapping for " + dependency_name + ". Make sure to add it in #{Dir.home}/.depswapper/depmapper.json"
					else 
	 			 		file_lines += "pod '" + @dependency_name + "', :git => '" + remote_url + "'\n"
	 			 	end
	 			 end
			end

			#<extra string manipulation to file_lines if you wanted>

			File.open(@podfile_path, 'w') do |file|
	  			file.puts file_lines
			end
		end
	end
end