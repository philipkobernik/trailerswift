class ResourcesController < InheritedResources::Base
  def attrs_for_index
    []
  end

  def attrs_for_form
    []
  end

  helper_method :attrs_for_index
  helper_method :attrs_for_form
end
