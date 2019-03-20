class RentalPropertiesController < ApplicationController
  geocode_ip_address 

  def index
    @location = get_location
    #params[:constraints] || {} 
    #byebug
    session[:constraints] = params[:constraints]
    @properties = RentalProperty.filter_on_constraints(session[:constraints] || {}, @location)
    session[:order] = params[:order]
    order = session[:order] || :distance
    if order.to_sym != :distance
        @properties = @properties.order(order)
    else
        if !@location.nil?
          @properties = @properties.by_distance(:origin => @location)
        end
    end
  end

  def show
    @location = get_location
    @property = RentalProperty.find(params[:id])
  end

    def new
        @property = RentalProperty.new
    end

    def create
        session[:rental_property] = params[:rental_property]
        geo = Geokit::Geocoders::MultiGeocoder.geocode(session[:rental_property][:address])
        if !geo.success
            flash[:warning] = "Rental property not created due to bad address entered"
            redirect_to new_rental_property_path and return
        end
        p = RentalProperty.new(create_update_params) # "mass assignment" of attributes!
        p.lat, p.lng = geo.lat, geo.lng
        if p.save
            flash[:notice] = "New rental property #{p.title} created successfully"
            redirect_to rental_properties_path
        else
            flash[:warning] = "Rental property couldn't be created"
            redirect_to new_rental_property_path
        end
    end

    def edit
        @property = RentalProperty.find(params[:id])
    end
    def update
        session[:rental_property] = params[:rental_property]
        geo = Geokit::Geocoders::MultiGeocoder.geocode(session[:rental_property][:address])
        if !geo.success
            flash[:warning] = "Rental property not updated due to bad address entered"
            redirect_to edit_rental_property_path and return
        end
        p = RentalProperty.find(params[:id]) # get existing object
        p.lat, p.lng = geo.lat, geo.lng
        if p.update(create_update_params) # update the object with mass assignment
            flash[:notice] = "Rental property #{p.title} updated successfully"
            redirect_to rental_property_path p
        else
            flash[:warning] = "Rental property couldn't be updated"
            redirect_to edit_rental_property_path
        end
    end

    def destroy 
        @property = RentalProperty.find(params[:id])
        @property.destroy
        flash[:notice] = "Rental property #{@property} deleted."
        redirect_to rental_properties_path
    end
        
private
  def get_location
    return [42.8270, -75.5446] # hamilton ny
    loc = session[:geo_location]
    if loc.nil?
      return loc
    else
      begin
        return [loc["lat"],loc["lng"]]
      rescue
        return nil
      end
    end
  end
    def create_update_params
        params.require(:rental_property).permit(:title, :description, :bedrooms, :beds, :maxpersons, :bathrooms, :pets_allowed, :address, :price, :image, :lat, :lng)
    end
end
