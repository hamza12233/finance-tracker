class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
        publishable_token: 'Tpk_b51e69522bab4742b8413a76618c534e',
        endpoint: 'https://sandbox.iexapis.com/v1' )
    client.price(ticker_symbol)
    begin
    new(ticker:ticker_symbol,name:client.company(ticker_symbol).company_name,last_price:client.price(ticker_symbol))
    rescue => exception
      return nil
      end
  end

end
