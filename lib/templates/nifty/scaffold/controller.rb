class <%= plural_class_name %>Controller < ApplicationController
  <%= controller_methods :actions %>

  private
  def <%= instance_name %>_params
    params.require(:<%=instance_name%>).permit()
  end
end
