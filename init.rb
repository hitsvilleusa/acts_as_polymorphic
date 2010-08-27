# require all of the acts_as_* files in lib
Dir.glob(File.join(RAILS_ROOT, 'lib', 'acts_as_*.rb')) do |filename|
  require filename
end

