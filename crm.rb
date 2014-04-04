require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String

  DataMapper.finalize # done defining tables, will throw error early before rest of code executes
  DataMapper.auto_upgrade! # tries to map with definition with DB file

  # an alternative to auto upgrade would be migrations which is a manual process
end

get '/' do
  @crm_app_name = "Brian CRM"
  erb :index
end

get "/contacts" do
  @contacts = Contact.all
  erb :contacts
end

get "/contacts/new" do

  erb :new_contact
end

get "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

post '/contacts' do
  @contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
    )
  redirect to('/contacts')
end

delete "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.destroy
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    Contact.update(
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :note => params[:note]
      )
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end
