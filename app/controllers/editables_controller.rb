class EditablesController < InheritedResources::Base
  before_filter :require_admin
end
