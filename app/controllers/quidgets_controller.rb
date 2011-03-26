class QuidgetsController < ActionController::Base
 
  def quidgets_checkbox_update 
    object=params[:object_model_name].camelize.constantize.find(params[:id])
    
    if params[:svalue]=="true"
      object.update_attribute(params[:method].to_sym,1)
    elsif params[:svalue]=="false"
      object.update_attribute(params[:method].to_sym,0)          
    end
    
    if object.save
      render :json => {:msg => "The #{params[:object_model_name]} was updated"}, :layout => false
    else
      render :json => {:msg => "Impossible to update #{params[:object_model_name]}"}, :layout => false
    end
  end
 
  def quidgets_textbox_update
    object=params[:object_model_name].camelize.constantize.find(params[:id])
    
    object.update_attribute(params[:method].to_sym, params[:svalue])
    
    if object.save
      render :json => {:msg => "The #{params[:object_model_name]} was updated"}, :layout => false
    else
      render :json => {:msg => "Impossible to update #{params[:object_model_name]}"}, :layout => false
    end
  end
  
  def quidgets_radio_group_update
    object  = params[:object_model].camelize.constantize.find(params[:id])
    choice  = params[:choice_model].camelize.constantize.find(params[:svalue])
    
    object.update_attribute(params[:choice_model].underscore + '_id', params[:svalue])
    
    if object.save
      render :json => {:msg => "The #{params[:object_model]} was updated"}, :layout => false
    else
      render :json => {:msg => "Impossible to update #{params[:object_model]}"}, :layout => false
    end
  end
  
  def quidgets_dropbox_update
    object  = params[:object_model].camelize.constantize.find(params[:id])
    choice  = params[:choice_model].camelize.constantize.find(params[:svalue])
    
    object.update_attribute(params[:choice_model].underscore + '_id', params[:svalue])
    
    if object.save
      render :json => {:msg => "The #{params[:object_model]} was updated"}, :layout => false
    else
      render :json => {:msg => "Impossible to update #{params[:object_model]}"}, :layout => false
    end
  end
  
  def quidgets_listbox_dragdrop_update
    order     = params[:order].map{|e| e[12,5].to_i}
    objects   = params[:object_model].camelize.constantize.find( order )
    sort_key  = params[:sort_key]
        
    logger.info "New order received from listbox_dragdrop: #{order.inspect}"

    objects.each do | object |
      logger.info( "#{object.class}: position: #{object.position} to #{order.index( object.id )}" )
      object.send("#{sort_key}=", order.index( object.id ) ) 
      object.send( :save )
    end   
    
    render :json => {:msg => "The #{params[:object_model]} ordering was updated"}, :layout => false
  end
end
