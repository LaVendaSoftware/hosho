class AddressesController < ApplicationController
  def show
    ucase = Addresses::GetByZipCode.call(zip_code: params[:zip_code])

    return render json: ucase.address if ucase.success?

    render json: nil, status: :not_found
  end
end
