# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ayl"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Sieh"]
  s.date = "2013-07-22"
  s.description = "Invoke code At Your Leisure. ayl is a small framework that simplifies the process of implementing asynchronous method calls in Ruby."
  s.email = "j0hnds@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "ayl.gemspec",
    "lib/ayl.rb",
    "lib/ayl/engine.rb",
    "lib/ayl/extensions.rb",
    "lib/ayl/logger.rb",
    "lib/ayl/logging.rb",
    "lib/ayl/mailer.rb",
    "lib/ayl/message.rb",
    "lib/ayl/message_options.rb",
    "lib/ayl/unrecoverable_message_exception.rb",
    "lib/ayl/worker.rb",
    "spec/engine_spec.rb",
    "spec/extensions_spec.rb",
    "spec/logger_spec.rb",
    "spec/mailer_spec.rb",
    "spec/message_options_spec.rb",
    "spec/message_spec.rb",
    "spec/spec_helper.rb",
    "spec/worker_spec.rb"
  ]
  s.homepage = "http://github.com/j0hnds/ayl"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Invoke code At Your Leisure"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.3.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.3.0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.3.0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end

