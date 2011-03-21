module QuidgetsHelper
###################################################################################### checkbox  
# checkbox(record,"active",{:id => "active_check_#{record.id}"})     
  def checkbox(object,method,html_options = {}, javascript_options = {}) 
    
    render :partial => 'templates/checkbox',
            :locals => {
              :html_options       => html_options,
              :is_checked         => object.send(method.to_sym)==true ,
              :object_model_name  => object.class.to_s, 
              :object_id          => object.id,
              :method             => method,
              :callback           => javascript_options[:callback]
            }
  end
###################################################################################### radio
# Role.all.each do |role|
#  html << radio(record,role,{:name => "role_option_#{record.id}"})  
# end

  def radio(object,choice,html_options = {}, javascript_options = {})
    
    render :partial => 'templates/radio',
            :locals => {
              :html_options => html_options,
              :object_model => object.class.to_s,
              :object_id    => object.id,
              :choice_model => choice.class.to_s,
              :choice_id    => choice.id,
              :is_checked   => object.send(choice.class.to_s.underscore.to_sym)==choice,
              :callback     => javascript_options[:callback]
            }
  end
###################################################################################### radio
#  html << radio_group(record,roles,{:name => "role_option_#{record.id}"}) 
  def radio_group(object,choices, choices_id, choices_label, html_options = {}, javascript_options = {})
  puts "--------------------------------------"
  puts javascript_options[:callback]
  puts "--------------------------------------"
  
    render :partial => 'templates/radio_group',
            :locals =>  {
              :object         =>  object,
              :choices        =>  choices,
              :choices_id     =>  choices_id,
              :choices_label  =>  choices_label,
              :html_options   =>  html_options,
              :callback       =>  javascript_options[:callback]
            }
  end
###################################################################################### textbox
  def text_box(object,method,html_options = {})
      
    render  :partial => 'templates/textbox', 
            :locals => { 
              :html_options => html_options,
              :value        => object.send(method.to_sym),
              :object_model => object.class.to_s,
              :object_id    => object.id,
              :method       => method
            }
  end
############################################################################### listbox drag and drop
#* LISTBOX DRAG & DROP: listbox_dragdrop(objects, label, sort_key, html_options = {})
#    <%= listbox_dragdrop(@user,PaymentMethod.all,{:id => "dropbox_#{@user.id}"}) %>   
  def listbox_dragdrop(objects, label, sort_key, html_options = {})
    render  :partial  => 'templates/listbox_dragdrop',
            :locals   => {
              :objects      =>  objects,
              :label        =>  label,
              :object_model =>  objects[0].class.to_s,
              :sort_key     =>  sort_key,
              :html_options =>  html_options
            }
  end
###################################################################################### listbox
#* LISTBOX: listbox(object,choices,html_options = {})
#    <%= listbox(@user,PaymentMethod.all,{:id => "dropbox_#{@user.id}"}) %>        

  def listbox(object,choices,html_options = {})
    
  end
###################################################################################### dropbox
#* DROPBOX: dropbox(object,choices,html_options = {})
# dropbox(user,Role.all,{:id => "role_#{user.id}"})

  def dropbox(object, method, choices, choices_id, choices_label, html_options = {})
    model_name=find_model_name(object)
    
    html_options['class']             = "ph-dropbox #{html_options['class']}".strip
    html_options['data-model-name']   = object.class.to_s
    html_options['data-model-id']     = object.id
    html_options['data-choice-model'] = choices[0].class.to_s
    
    render :partial => 'templates/dropbox',
           :locals  => {
             :html_options  => html_options,
             :object        => object,
             :method        => method,
             :choices       => choices,
             :choices_id    => choices_id,
             :choices_label => choices_label
           }
  end
###################################################################################### textbox
  def textbox(object,field,html_options = {})
    render :file => 'views/textbox.html.erb'
  end

######################################################################################  PRIVATE
  private
  def find_model_name(object)
    if object.to_s.match(/<.*:/)
      return $&.gsub(/<|:/,"")
    else
      return nil
    end
  end
###################################################################################### END
end
