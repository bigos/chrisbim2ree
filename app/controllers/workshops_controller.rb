class WorkshopsController < InheritedResources::Base
  before_filter :require_admin, :except => [:index, :show]
end
