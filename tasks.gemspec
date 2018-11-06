
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tasks/version"

Gem::Specification.new do |spec|
  spec.name          = "tasks_gem"
  spec.version       = Tasks::VERSION
  spec.authors       = ["marina8915"]
  spec.email         = ["nonalatus@ukr.net"]

  spec.summary       = %q{50 tasks}
  spec.homepage      = "https://github.com/marina8915/ruby-tasks-50"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "run_tests", "~> 0.1.2"
end
