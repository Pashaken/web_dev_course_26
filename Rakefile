# frozen_string_literal: true
# 
require "rake/testtask"
require "bundler/gem_tasks"

Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.libs << "spec"
  t.pattern = "spec/test.rb"
end

task default: :test