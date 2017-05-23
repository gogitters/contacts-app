class ContactsController < ApplicationController
  def index
    # @contacts = Contact.where(user_id: current_user.id)
    if current_user
      @contacts = current_user.contacts
      render "index.html.erb"
    else
      flash[:warning] = "You must be signed in to view your contacts"
      redirect_to "/login"
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    if current_user.contacts.include?(@contact)
      render "show.html.erb"
    else
      flash[:warning] = "Yo. This isn't your contact."
      redirect_to "/"
    end
  end

  def new
    render "new.html.erb"
  end

  def create
    new_coords = Geocoder.coordinates(params[:address])
    latitude = new_coords.first
    longitude = new_coords.last
    contact = Contact.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], bio: params[:bio], latitude: latitude, longitude: longitude, user_id: current_user.id)
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

  def search
    # Recipe.where("chef LIKE ? OR prep_time = ?", "%Ray%", 10)
    @contacts = Contact.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    render "index.html.erb"
  end
end
