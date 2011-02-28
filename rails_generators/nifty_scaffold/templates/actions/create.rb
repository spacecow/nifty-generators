  def create
    @<%= singular_name %> = <%= class_name %>.new(params[:<%= singular_name %>])
    if @<%= singular_name %>.save
      flash[:notice] = "Successfully created <%= name.underscore.humanize.downcase %>."
      redirect_to <%= item_path('url') %>, :notice => created(:<%= singular_name %>)
    else
      render :action => 'new'
    end
  end
