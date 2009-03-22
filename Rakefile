# --------------------------------------------------
# tasks mostly copied from thin's Rakefile
# http://github.com/macournoyer/thin/tree/master
# --------------------------------------------------

require 'rake/gempackagetask'
require 'pathname'
require 'yaml'

RUBY_1_9  = RUBY_VERSION =~ /^1\.9/
WIN       = (RUBY_PLATFORM =~ /mswin|cygwin/)
SUDO      = (WIN ? "" : "sudo")

def gem
  RUBY_1_9 ? 'gem19' : 'gem'
end

def all_except(paths)
  Dir['**/*'] - paths.map {|path| path.strip.gsub(/^\//,'').gsub(/\/$/,'') }
end

spec = Gem::Specification.new do |s|
  s.name            = 'every'
  s.version         = '0.9'
  s.summary         = "Symbol#to_proc's hot cousin. Simple and elegant alternative to using &:method with enumerables."
  s.description     = "Symbol#to_proc's hot cousin. Simple and elegant alternative to using &:method with enumerables."
  s.author          = "Martin Aumont"
  s.email           = 'mynyml@gmail.com'
  s.homepage        = ''
  s.has_rdoc        = true
  s.require_path    = "lib"
  s.files           = Dir['**/*']
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end


desc "Remove package products"
task :clean => :clobber_package

desc "Update the gemspec for GitHub's gem server"
task :gemspec do
  Pathname("#{spec.name}.gemspec").open('w') {|f| f << YAML.dump(spec) }
end

desc "Install gem"
task :install => [:clobber, :package] do
  sh "#{SUDO} #{gem} install pkg/#{spec.full_name}.gem"
end

desc "Uninstall gem"
task :uninstall => :clean do
  sh "#{SUDO} #{gem} uninstall -v #{spec.version} -x #{spec.name}"
end

