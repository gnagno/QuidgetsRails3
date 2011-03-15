# Quidgets #


A collection of helper widgets that directly bind to your database structure.
It's extremely simple to use.

## HOW TO INSTALL ##


* Install plugin from git:
  
    rails plugin install git://github.com/gnagno/quidgets2.git
  
* modify your application.html.erb, replace in the <head> tag the include javascript directive with:
  
    <%= javascript_include_tag 'jquery-1.5.1.min.js' %>
    <%= javascript_include_tag ph_quidgets_jquery_path %>

## Example ##

### Generate two example models: ###
  
    rails g model user name:string description:text active:boolean role_id:integer
  
  
    rails g model role name:string

### Models associations: ###

  + user.rb
  
      belongs_to :role
    
  + role.rb
  
      has_many :users
      
### Generate a test controller and action ###

    rails g controller test index
    
In your index action create some test objects and pass them to the view:

    if( User.count == 0 )
      User.create!(:name => "Ignazio", :active => true, :description => "my test user") 
    end
    
    if(Role.count == 0)
      Role.create!(:name => "Manager")
      Role.create!(:name => "Administrator")
      Role.create!(:name => "Programmer")
    end
      
    @user   = User.first
    @roles  = Role.all
  
  
Finally let's add some widgets to our test view:

    <h1>Index#index</h1>

    <h2>Testing checkbox</h2>

    <%= label_tag( "active_check_#{@user.id}", "User active") %>
    <%= raw checkbox( @user,"active",{:id => "active_check_#{@user.id}", :name => 'test', :class=>'hello'}) %>

    <hr />

    <h2>Testing radio</h2>

    <%= raw radio_group(@user,Role.all, :id, :name, {:name => "role_group_#{@user.id}"}) %>

    <hr />

    <h2>Testing textbox</h2>

    <%= raw text_box(@user, "name", {:id => "user_textbox_#{@user.id}"})%>

    <hr />

    <h2>Testing listbox</h2>

    <hr />

    <h2>Testing dropbox</h2>

    <%= raw dropbox(@user, :role_id, Role.all, :id, :name, {:id => "role_#{@user.id}"}) %>

Launch the server, visit http://localhost:3000/test/index and have fun :)

## Supported widgets 

* CHECKBOX: checkbox(object,method,html_options = {})   
    Ex: <%= raw checkbox( @user,"active",{:id => "active_check_#{@user.id}", :name => 'test', :class=>'hello'}) %>

          
* RADIO BUTTON: radio(object,choice,html_options = {})
    Ex: 
       
     <%= raw radio_group(@user,Role.all, :id, :name, {:name => "role_group_#{@user.id}"}) %>
     
      
* TEXTBOX:
    
    <%= raw text_box(@user, "name", {:id => "user_textbox_#{@user.id}"})%>


    
* LISTBOX: (in progress)
    
* DROPBOX: dropbox(instance,choices,html_options = {})
    EX: <%= dropbox(user,Role.all,{:id => "role_#{user.id}"}) %>

    
* listbox_dragdrop(params) # Coming soon


Copyright (c) 2010 Quidgets, released under the MIT license
