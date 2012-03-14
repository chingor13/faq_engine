require File.expand_path("../lib/faq_engine/version", __FILE__)
# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "faq_engine"
  s.version = FaqEngine::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jeff Ching"]
  s.email = ["ching.jeff@gmail.com"]
  s.homepage = "http://chingr.com"
  s.summary = "FaqEngine provides a basic FAQ resource."
  s.description = "FaqEngine provides a basic FAQ resource.  You can customize views and storage engines"

  # dependencies
  s.add_dependency "activesupport", "~> 3.1.0"
  s.add_dependency "rails", "~> 3.1.0"

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = "lib"
end