require_relative 'contact'
require_relative 'rolodex'

require 'sinatra'

@@rolodex = Rolodex.new
@@rolodex.add_contact(Contact.new("Brian", "Simon", "brian.simon@tarsipix.com","Test Note"))
@@rolodex.add_contact(Contact.new("John", "Doe", "hello.goodbye@snoopy.com","Test Note 2"))


get '/' do
  @crm_app_name = "Brian CRM"
  erb :index
end

get "/contacts" do
  erb :contacts
end

get "/contacts/new" do

  erb :new_contact
end

get "/contacts/:id" do
  puts params
  @contact = @@rolodex.find(params[:id])
  erb :show_contact
end

get "/contacts/:id/edit" do

  # erb :contacts
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end
