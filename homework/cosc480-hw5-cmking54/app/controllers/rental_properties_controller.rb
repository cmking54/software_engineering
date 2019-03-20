class RentalPropertiesController < ApplicationController
  geocode_ip_address

  def index
    do_redirect, view_prefs = update_settings(params, session)
    if do_redirect
      flash.keep
      redirect_to rental_properties_path(view_prefs) and return
    end

    @properties = filter_and_sort view_prefs

    # set filter values for display
    @maxpersons = view_prefs["maxpersons_filter"]
    @bathrooms = view_prefs["bathrooms_filter"]
    @price = view_prefs["price_filter"]
    @distance = view_prefs["distance_filter"]
    @location = view_prefs["location_filter"].to_s.strip
    @currloc = get_location
  end

  def show
    @location = get_location
    @property = RentalProperty.find(params[:id])
  end

  def new
    @property = RentalProperty.new
  end

  def create
    p = RentalProperty.new(create_update_params)
    geo=Geokit::Geocoders::MultiGeocoder.geocode(p.address)
    if geo.success
      p.lat, p.lng = geo.lat, geo.lng 
      if p.save
        flash[:notice] = "New rental property \'#{p.title}\' created"
        redirect_to rental_properties_path and return
      else
          flash[:error] = "Error creating new rental property"
          redirect_to new_rental_property_path(p) and return
      end
    else
      flash[:error] = "Error geocoding address!"
      redirect_to new_rental_property_path(p) and return
    end
  end

  def edit
    id = params[:id]
    @property = RentalProperty.find(id)
  end

  def update
    id = params[:id]
    p = RentalProperty.find(id)
    oldaddress = p.address
    p.update(create_update_params)
    if p.address != oldaddress
      geo=Geokit::Geocoders::MultiGeocoder.geocode(p.address)
      if geo.success
        p.lat, p.lng = geo.lat, geo.lng
      else
        flash[:error] = "Error geocoding address"
        redirect_to edit_rental_property_path(p) and return
      end
    end

    if p.save
      flash[:notice] = "Rental property \"#{p.title}\" updated"
      redirect_to rental_properties_path and return
    else
      flash[:error] = "Error updating rental property"
      redirect_to edit_rental_property_path(p) and return
    end
  end

  def destroy
    @property = RentalProperty.find(params[:id])
    @property.destroy
    flash[:notice] = "Rental property \'#{@property.title}\' deleted"
    redirect_to rental_properties_path
  end

private
  def get_location
    # return [42.8270, -75.5446] # hamilton ny
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
    params.require(:rental_property).permit(:title, :description, :bedrooms, :beds, :maxpersons, :bathrooms, :pets_allowed, :address, :price, :image)
  end

  def update_settings(parms, sess)
    preferences = sess[:preferences] || Hash.new
    if parms[:reset_filters]
      session.clear
      return true, preferences
    end

    should_redirect = false
    { "order" => :distance, "maxpersons_filter" => "", "bathrooms_filter" => "",
      "price_filter" => "", "distance_filter" => "",
      "location_filter" => ""}.each do |parm, default|
        parmval = parms[parm]
        if parmval.nil?  # not currently set; look at session
          parmval = preferences[parm] || default
          should_redirect = true
        elsif parmval != preferences[parm]  # is set, but is it different?
          should_redirect = true
        end
        preferences[parm] = parmval
    end

    sess[:preferences] = preferences
    return should_redirect, preferences
  end

  def filter_and_sort(view_prefs)
    # handle non-distance-related filter/sort
    constraints = {}
    maxpersons = view_prefs["maxpersons_filter"].to_i
    if maxpersons > 0
      constraints[:maxpersons] = maxpersons
    end
    bathrooms = view_prefs["bathrooms_filter"].to_i
    if bathrooms > 0
      constraints[:bathrooms] = bathrooms
    end
    price = view_prefs["price_filter"].to_f
    if price > 0
      constraints[:price ] = price
    end

    properties = RentalProperty.filter_on_constraints(constraints)

    order = view_prefs["order"]
    if order.to_sym != :distance
      properties = properties.order(order)
    end

    # handle distance-related filter/sort
    client_location = get_location
    distance = view_prefs["distance_filter"].to_i
    location = view_prefs["location_filter"].to_s.strip

    if !client_location.nil? && !client_location[0].nil? && order.to_sym == :distance
      properties = properties.by_distance(:origin => client_location)
    end

    if location != "" && distance > 0
      logger.debug("Location filt #{location}, #{distance}")
      properties = properties.within(distance, :origin => location)
    end
    properties
  end
end
