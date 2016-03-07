class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)
    respond_to do |format|
      format.html
      #format.csv { send_data @products.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end
  
  def import
    data = Product.import(params[:file])
    render json: data
    #redirect_to root_url, notice: "excel file imported successfully"
  end
end
