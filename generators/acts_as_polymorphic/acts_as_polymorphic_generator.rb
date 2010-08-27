class ActsAsPolymorphicGenerator < Rails::Generator::NamedBase
  attr_reader :association_name, :association_class_name, :dependency_style
  
  def initialize(runtime_args, runtime_options = {})
    super
    
    @association_name       = (args.shift || singular_name.sub(/able$/, 'ion')).pluralize
    @association_class_name = (args.shift || @association_name.singularize).camelize
    @dependency_style       = (args.shift || 'nullify').downcase
  end
  
  def manifest
    record do |m|
       m.directory "lib"
       m.template 'acts_as.rb', "lib/acts_as_#{singular_name}.rb"
    end
  end
end
