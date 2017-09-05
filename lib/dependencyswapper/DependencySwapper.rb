#!/usr/bin/env ruby
require_relative 'DependencyReplacer.rb'

dependency_name = ARGV[0]
DependencyReplacer.new({
		:dependency_name => dependency_name
	}).run