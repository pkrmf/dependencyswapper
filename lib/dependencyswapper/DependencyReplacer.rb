#!/usr/bin/env ruby
require 'fileutils'
require 'tempfile'
require_relative 'DependencyMapper.rb'
module Dependency
	class DependencyReplacer
		attr_reader :dependency_name

		def self.perform(options)
			new(options).perform
		end

		def initialize(options)
			@dependency_name = options.fetch(:dependency_name)
			@podfile_path = "Podfile"
		end

		def run
			file_lines = ''
			dependency_mapper = DependencyMapper.new({})
			IO.readlines(@podfile_path).each do |line|
	 			 file_lines += line unless line.include? "'" + dependency_name + "'"
	 			 if line.include? "'" + dependency_name + "'"
	 			 	# We will look at the DependencyMapper to map each Framework with its git repository.
	 			 	remote_url = dependency_mapper.dependency_replacements[dependency_name]
	 			 	puts remote_url
	 			 	file_lines += "pod '" + @dependency_name + "', :git => '" + remote_url + "'\n"
	 			 end
			end

			#<extra string manipulation to file_lines if you wanted>

			File.open(@podfile_path, 'w') do |file|
	  			file.puts file_lines
			end
		end
	end
end