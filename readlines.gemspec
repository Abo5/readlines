Gem::Specification.new do |spec|
    spec.name          = "readlines"
    spec.version       = "1.5"
    spec.authors       = ['Maven']

    spec.summary       = "A Ruby library for advanced text file manipulation and processing."
    spec.description   = "Readlines is a Ruby library offering advanced tools for reading, writing, and manipulating text files. It supports searching, replacing, sorting, splitting, merging, handling CSVs, encryption, and more. Perfect for developers needing efficient and complex file operations."
    spec.homepage      = "https://github.com/Abo5/readlines"
    spec.license       = "MIT"

    spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE.txt"]

    spec.bindir        = "exe"
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ["lib"]
  
    spec.add_runtime_dependency 'json', '~> 2.0'
    spec.add_runtime_dependency 'fileutils', '~> 1.7.2'

    spec.add_development_dependency "bundler", "~> 2.0"
    spec.add_development_dependency "rake", "~> 13.0"
    spec.add_development_dependency "rspec", "~> 3.0"
  end
