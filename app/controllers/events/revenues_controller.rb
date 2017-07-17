class Events::RevenuesController < ApplicationController
  #before_action :set_event
  #before_action :set_revenue, only: [:edit, :update, :destroy]


  def create
    @event = Event.find(params[:event_id])
    @revenue = @event.revenues.new(revenue_params)
   
    if @revenue.save
      flash[:success] = "Revenue has been added."
    else
      flash.now[:danger] = "Error occured while adding revenue."
    end
    redirect_to event_path(@event.id)
  end

  # def update
    
  #   respond_to do |format|
  #     if @revenue.update(revenue_params)
  #       format.html { redirect_to @event, notice: 'Revenue was successfully updated.' }
  #     else
  #       format.html { render :edit }
  #     end
  #   end
  # end

  # DELETE /revenues/1
  # DELETE /revenues/1.json
  
  
  def destroy
    @event = Event.find(params[:event_id])
    @revenue = @event.revenues.find(params[:id])
    title = @revenue.source
    
    @revenue.destroy
    
    respond_to do |format|
      format.html { redirect_to event_path(@event.id), notice: "\"#{title}\" revenue was successfully removed from #{@event.name.capitalize}." }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end
   
    def set_revenue
      @revenue = @event.revenues.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revenue_params
      params.require(:revenue).permit(:source, :amount, :event_id)
    end
    
    
end
