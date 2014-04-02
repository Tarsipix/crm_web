require_relative 'contact'
require_relative 'rolodex'

require 'sinatra'

@@rolodex = Rolodex.new

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

get "/contacts/:id/edit" do

  # erb :contacts
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
redirect to('/contacts')
end
