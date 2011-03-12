# Quidgets #


A collection of helper widgets that directly bind to your database structure.
It's extremely simple to use.

## HOW TO INSTALL ##


* Install plugin from git:
    rails plugin install git://github.com/phtphan/Quidgets.git

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
  
## Supported widgets 

* CHECKBOX: checkbox(object,method,html_options = {})   
    Ex: <%= raw checkbox( @user,"active",{:id => "active_check_#{@user.id}", :name => 'test', :class=>'hello'}) %>

          
* RADIO BUTTON: radio(object,choice,html_options = {})
    Ex:    
     Role.all.each do |role|
      html << radio(user,role,{:name => "role_option_#{record.id}"}) << "#{role.name}" 
     end
      
* TEXTBOX: (in progress)


    
* LISTBOX: (in progress)
    
* DROPBOX: dropbox(instance,choices,html_options = {})
    EX: <%= dropbox(user,Role.all,{:id => "role_#{user.id}"}) %>

    
* listbox_dragdrop(params) # Coming soon


Copyright (c) 2010 Quidgets, released under the MIT license
