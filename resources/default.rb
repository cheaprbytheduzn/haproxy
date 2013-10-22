actions :create, :delete
default_action :create

attribute :config_directory, :kind_of => String
attribute :config, :kind => [Hash, (AttributeStruct if defined?(AttributeStruct))].compact, :required => true
