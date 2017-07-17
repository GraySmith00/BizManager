class Events::ExpensesController < ApplicationController
  #before_action :set_event
  #before_action :set_expense, only: [:edit, :update, :destroy]

  

  # POST /expenses
  # POST /expenses.json
  def create
    @event = Event.find(params[:event_id])
    @expense = @event.expenses.new(expense_params)
   
    if @expense.save
      flash[:success] = "Expense has been added."
    else
      flash.now[:danger] = "Error occured while adding expense."
    end
    redirect_to event_path(@event.id)
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @expense = @event.expenses.find(params[:id])
  end

  
  def update
    @event = Event.find(params[:event_id])
    @expense = @event.expenses.find(params[:id])
    
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @event, notice: 'expense was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  
  
  def destroy
    @event = Event.find(params[:event_id])
    @expense = @event.expenses.find(params[:id])
    title = @expense.source
    
    @expense.destroy
    
    respond_to do |format|
      format.html { redirect_to event_path(@event.id), notice: "\"#{title}\" expense was successfully removed from #{@event.name.capitalize}." }
    end
    
  end

  private
    
    def set_event
      @event = Event.find(params[:event_id])
    end
   
    def set_expense
      @expense = @event.expenses.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:source, :amount, :event_id)
    end
    
    
end
