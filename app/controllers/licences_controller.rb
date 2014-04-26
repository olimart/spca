class LicencesController < ApplicationController
	layout 'narrow'

  def renew
  	#@payment = Payment.new
  end

  def search
  	if params[:q].present?
  		@animal = Animal.find_by(licence: params[:q])

  		respond_to do |format|
        format.html
        format.js {  }
      end
    end
  end
end
