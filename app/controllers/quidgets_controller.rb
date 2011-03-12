class QuidgetsController < ActionController::Base
 
  def quidgets_checkbox_update 
    object=params[:object_model_name].camelize.constantize.find(params[:id])
    
    if params[:svalue]=="true"
      object.update_attribute(params[:method].to_sym,1)
    elsif params[:svalue]=="false"
      object.update_attribute(params[:method].to_sym,0)          
    end
    
    object.save!
    render :json => {:msg => "The #{params[:object_model_name]} was updated"}, :layout => false
  end
 
end
