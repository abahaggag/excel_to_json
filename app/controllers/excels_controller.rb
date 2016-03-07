class ExcelsController < ApplicationController
  
  def index
  end
  
  def import
    @data = Excel.import(params[:file])
    
    respond_to do |format|
      format.html 
      format.json { render json: @data }
    end
  end
  
  def test
    data = "aaab #{params[:data]}"
    
    render json: data
  end
end
