Gem::Specification.new do |s|
  s.name                = "every"
  s.version             = "1.0"
  s.summary             = "Symbol#to_proc's hot cousin. Simple and elegant alternative to using &:method with enumerables"
  s.description         = "Symbol#to_proc's hot cousin. Simple and elegant alternative to using &:method with enumerables."
  s.author              = "Martin Aumont"
  s.email               = "mynyml@gmail.com"
  s.homepage            = "http://github.com/mynyml/every"
  s.rubyforge_project   = "every"
  s.has_rdoc            =  true
  s.require_path        = "lib"
  s.files               =  File.read("Manifest").strip.split("\n")

  s.add_development_dependency 'context'
  s.add_development_dependency 'matchy'
end
