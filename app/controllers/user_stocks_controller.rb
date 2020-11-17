class UserStocksController < ApplicationController

  def create
    stock = Stock.check_ticker_in_db(params[:ticker])
    if stock.blank?
    stock = Stock.new_lookup(params[:ticker])
    stock.save
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was successfully added in my portfolio"
    redirect_to my_portfolio_path

    else
      flash[:alert] = "ticker already in stock"
      redirect_to my_portfolio_path
    end



  end

end
