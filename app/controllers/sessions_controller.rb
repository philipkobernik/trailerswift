class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    respond_to do |format|
      format.html { super }
      format.json do
        resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
        return sign_in_and_redirect(resource_name, resource)
      end
    end
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => resource, :status => :ok
  end

  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}, :status => :unauthorized
  end

end
