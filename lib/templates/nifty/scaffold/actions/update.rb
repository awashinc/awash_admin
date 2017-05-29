  def update
    @<%= instance_name %> = <%= class_name %>.find(params[:id])
    if @<%= instance_name %>.update_attributes(<%= instance_name %>_params)
      redirect_to <%= items_url %>, :notice  => "Successfully updated <%= class_name.underscore.humanize.downcase %>."
    else
      render :edit
    end
  end
