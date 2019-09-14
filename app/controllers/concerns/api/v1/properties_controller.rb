module Api
  module V1
    class PropertiesController < ApplicationController
      def index 
        properties = Property.order(created_at: :desc)
        render json: {status: 'SUCCESS', message: 'loaded properties', data: properties}
      end

      def show
        property = Property.find(params[:id])
        render json: {status: 'SUCCESS', message: 'loaded property', data: property}
      end

      def create
        property = Property.new(property_params)
        if property.save
          render json: { status: 'SUCCESS', message: 'loaded the post', data: property }
        else
          render json: { status: 'ERROR', message: 'post not saved', data: property.errors }
        end
      end

      def destroy
        property = Property.find(params[:id])
        property.destroy
        render json: { status: 'SUCCESS', message: 'deleted the property', data: property }
      end
        
      def update
        property = Property.find(params[:id])
        if property.update(property_params)
          render json: { status: 'SUCCESS', message: 'updated the property', data: property }
        else
          render json: { status: 'SUCCESS', message: 'loaded the property', data: property }
        end
      end

      private

      def property_params
        params.require(:property).permit(:name, :address1, :address2, :city, :state, :purchase_price, :rental_price)
      end
    end
  end
end
