class RentalPropertiesController < ApplicationController
    geocode_ip_address
    def index 
        location # also may not work
        #@properties = RentalProperty.all
        case params[:sort]
        when 'title','maxpersons', 'price'
            @properties = RentalProperty.order(params[:sort].to_sym)
        else
            @properties = RentalProperty.by_distance(:origin => @location)
        end
    end
    def show 
        @property = RentalProperty.find(params[:id])
        #@property.lat, @property.lng  = location # may not work
        location # also may not work
    end
    private
    def location
        if session[:geo_location].nil?
            @location = [42.8270, -75.5446]
        else
            @location = [session[:geo_location]["lat"], session[:geo_location]["lng"]]
        end
    end
end
