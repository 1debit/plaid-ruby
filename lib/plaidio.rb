require 'plaidio/config'
require 'plaidio/errors'
require 'plaidio/call'
require 'plaidio/customer'
require 'rest_client'

module Plaidio
  autoload :Connection, 'plaid/connection'
  class << self
    include Plaidio::Configure

    # Defined when a user exists with a unique access_token. Ex: Plaidio.customer.get_transactions
    def customer
      @customer = Plaidio::Customer.new
    end

    # Defined for generic calls without access_tokens required. Ex: Plaidio.call.add_accounts(username,password,type)
    def call
      @call = Plaidio::Call.new
    end
    
    # Exchange a Plaid Link public_token for an access_token
    def exchange_token(public_token)
      payload = { public_token: public_token }
      
      res = Connection.post('exchange_token', payload)
      res
    end
    
  end
end
