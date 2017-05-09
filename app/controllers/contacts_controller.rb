class ContactsController < ApplicationController
  def first_contact_method
    @contact = Contact.first
    render "first_contact_view.html.erb"
  end

  def all_contacts_method
    @contacts = Contact.all
    render "all_contacts.html.erb"
  end
end
