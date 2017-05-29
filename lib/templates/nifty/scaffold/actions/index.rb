  def index
    @<%= instances_name %> = <%= class_name %>.page(params[:page]).per(30)
  end
