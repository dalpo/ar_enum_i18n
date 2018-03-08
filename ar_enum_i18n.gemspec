# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ar_enum_i18n/version"

Gem::Specification.new do |spec|
  spec.name          = "ar_enum_i18n"
  spec.version       = ArEnumI18n::VERSION
  spec.authors       = ["Andrea Dal Ponte"]
  spec.email         = ["info@andreadalponte.com"]

  spec.summary       = %q{ActiveRecord Enum I18n support}
  spec.description   = %q{ActiveRecord Enum I18n support}
  spec.homepage      = "https://github.com/dalpo/ar_enum_i18n"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.50"
end
