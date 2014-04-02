require_relative 'contact'
require 'sinatra'

get '/' do
  @crm_app_name = "Brian CRM"
  erb :index
end

get "/contacts" do
  @contacts = []
  puts "++++++++++++++"
  @contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  @contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  @contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
  erb :contacts
end

get "/contacts/new" do

  # erb :contacts
end

get "/contacts/:id/edit" do

  # erb :contacts
end
