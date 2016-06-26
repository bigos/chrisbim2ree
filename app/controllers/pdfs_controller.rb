class PdfsController < InheritedResources::Base
  before_filter :require_admin
end
