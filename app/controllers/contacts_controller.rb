class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    new_coords = Geocoder.coordinates(params[:address])
    latitude = new_coords.first
    longitude = new_coords.last
    contact = Contact.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], bio: params[:bio], latitude: latitude, longitude: longitude)
    contact.save
    flash[:success] = "Contact Created"
    redirect_to "/contacts/#{contact.id}"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    contact = Contact.find_by(id: params[:id])
    contact.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number],middle_name: params[:middle_name], bio: params[:bio])
    contact.save
    flash[:success] = "Contact Updated"
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    flash[:success] = "Contact deleted"
    redirect_to root_path
  end

  def all_johns
    @contacts = Contact.all_johns
    render "index.html.erb"
  end
end
