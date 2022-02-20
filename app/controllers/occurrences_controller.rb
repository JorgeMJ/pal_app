class OccurrencesController < ApplicationController
  
  def index
    #This will show all instances
    @occurrences = Occurrence.all

    render :index
  end

  def new
    #use GET
    #Will send an new 'occurence' object to 'view' to see the form
    @occurrence = Occurrence.new

    render :new
  end

  def create
    #use POST
    #When user clicks submit button in the form, it will call this
    #action that will save a new instance in the model. This need to be 'save'
     
    time = Time.now.to_formatted_s(:short) #local vs utc
  
    antecedent = params[:occurrence]['antecedent']
    @occurrence = Occurrence.new({time: time, antecedent: antecedent})

    if @occurrence.save
      #flash[:success] = 'Successfully saved'
      redirect_to @occurrence, alert: "Successfully saved"
    else
      redirect_to new_path, alert: "Error saving. Try again"
    end
  end

  def show
    @occurrence = Occurrence.find(params[:id])
    puts "HERE ID: ", @occurrence.id
    render :show
  end

  def delete
    #This will destroy the last one
    @occurrence = Occurrence.last 

    @occurrence.destroy #dfference between 'destroy and delete'

    
  end

  private

    # def occurrence_params
    #   params.require().permit()
    # end

end
