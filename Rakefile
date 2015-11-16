require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task(:default).clear
task default: [:spec, "bundler:audit"]
