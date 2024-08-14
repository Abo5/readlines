Gem::Specification.new do |spec|
    spec.name          = "readlines"
    spec.version       = "1.2"
    spec.authors       = ['Maven']
    spec.email         = ['qppn@hotmail.com']

    spec.summary       = "A Ruby library for advanced text file manipulation and processing."
    spec.description   = "Readlines is a Ruby library offering advanced tools for reading, writing, and manipulating text files. It supports searching, replacing, sorting, splitting, merging, handling CSVs, encryption, and more. Perfect for developers needing efficient and complex file operations."
    spec.homepage      = "https://github.com/Abo5/readlines"
    spec.license       = "MIT"

    spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
        `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
    end
    spec.bindir        = "exe"
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ["lib"]
  
    spec.add_runtime_dependency 'json', '~> 2.0'
    spec.add_runtime_dependency 'fileutils', '~> 1.7.2'

    spec.add_development_dependency "bundler", "~> 2.0"
    spec.add_development_dependency "rake", "~> 13.0"
    spec.add_development_dependency "rspec", "~> 3.0"
  end
