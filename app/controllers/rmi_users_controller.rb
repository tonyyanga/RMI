class RmiUsersController < ApplicationController
  def show
    @rmi_user = RmiUser.find(params[:id])
    if rmi_user_signed_in? && current_rmi_user.id == @rmi_user.id
      @portfolios = Portfolios.all
      if @portfolios
        redirect_to controller: 'Portfolios', action: 'index'
      else
        @message = 'No portfolios available'
      end
    else
      @message = 'The RMI User is not currently logged in.'
    end
  end
end

