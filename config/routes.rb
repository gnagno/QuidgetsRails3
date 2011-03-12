ActionController::Routing::Routes.draw do |map|

  match 'ph_quidgets/checkbox/update' => 'quidgets#quidgets_checkbox_update', :as => :ph_quidgets_checkbox_update

  match 'ph_quidgets/textbox/update' => 'quidgets#quidgets_textbox_update', :as => :ph_quidgets_textbox_update
end
