actions :create, :delete
default_action :create

attr_reader :config
attribute :config_directory, :kind_of => String

def method_missing(name, value, &block)
  if(name.to_sym == :config)
    @config = value || block
  else
    super
  end
end
