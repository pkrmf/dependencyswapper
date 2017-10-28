#!/usr/bin/env ruby
require 'fileutils'
require 'tempfile'
require 'json'
require 'find'
require 'colorize'
require "dependencyswapper/graph.rb"

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
			graph = Dependency::Graph.new({
				 			 	:podfilelock_path => @podfile_path + ".lock"
			})
			pods = graph.generate()

			#tag variable to store the version
			tag = ""

			pods.each { |pod|
				if pod.name.eql? @dependency_name
					tag = pod.version
				end
			}

			file_lines = ''

			IO.readlines(@podfile_path).each do |line|
	 			 file_lines += line unless line.include? "'" + dependency_name + "'"
	 			 if line.include? "'" + dependency_name + "'"
	 			 	# We will look in the cocoapods public/private repos to map each Framework with its git repository.
	 			 	directories = Dir.glob("#{Dir.home}/.cocoapods/repos/**/" + dependency_name + ".podspec.json")
	 			 	file = File.read(directories.last)
					dependency_replacements = JSON.parse(file)

	 			 	remote_url = dependency_replacements["homepage"]
	 			 	if remote_url.to_s.empty?
  						puts "You are missing the dependency mapping for " + dependency_name + "."
					else
						url_extension = File.extname(remote_url)
						if url_extension.to_s.empty?
							remote_url = remote_url + ".git"
						end

						if tag.length > 0
							file_lines += "pod '" + @dependency_name + "', :git => '" + remote_url + "', :tag => '" + tag + "'\n"
	 			 		else
	 			 			file_lines += "pod '" + @dependency_name + "', :git => '" + remote_url + "'\n"
	 			 		end
	 			 	end
	 			 end
			end
			File.open(@podfile_path, 'w') do |file|
	  			file.puts file_lines
			end
			system("pod install")
		end

		def dev
			graph = Dependency::Graph.new({
				 :podfilelock_path => @podfile_path + ".lock"
			})
			pods = graph.generate()

			#tag variable to store the version
			tag = ""

			pods.each { |pod|
				if pod.name.eql? @dependency_name
					tag = pod.version
				end
			}

			file_lines = ''
			IO.readlines(@podfile_path).each do |line|
	 			 file_lines += line unless line.include? "'" + dependency_name + "'"
	 			 if line.include? "'" + dependency_name + "'"
	 			 		 			 	# We will look in the cocoapods public/private repos to map each Framework with its git repository.
	 			 	directories = Dir.glob("#{Dir.home}/.cocoapods/repos/**/" + dependency_name + ".podspec.json")
	 			 	file = File.read(directories.last)
					dependency_replacements = JSON.parse(file)

	 			 	remote_url = dependency_replacements["homepage"]
	 			 	if remote_url.to_s.empty?
  						puts "You are missing the dependency mapping for " + dependency_name + "."
					else
						url_extension = File.extname(remote_url)
						if url_extension.to_s.empty?
							remote_url = remote_url + ".git"
						end
						unless File.directory?("dev-#{dependency_name}")
							if tag.length > 0
								`git clone --branch #{tag} #{remote_url} dev-#{dependency_name}`
							else
								`git clone #{remote_url} dev-#{dependency_name}`
							end
						end
	 			 		file_lines += "pod '" + @dependency_name + "', :path => './dev-" + dependency_name + "/'\n"
	 			 	end
	 			 end
			end

			File.open(@podfile_path, 'w') do |file|
	  			file.puts file_lines
			end
			development_dir = Dir.pwd + "/dev-" + dependency_name
			puts "The development pod was cloned in ".green + development_dir.green
			system("pod install")
		end
	end
end
