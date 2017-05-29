  def create
    @<%= instance_name %> = <%= class_name %>.new(<%= instance_name %>_params)
    if @<%= instance_name %>.save
      redirect_to <%= items_url %>, :notice => "Successfully created <%= class_name.underscore.humanize.downcase %>."
    else
      render :new
    end
  end
