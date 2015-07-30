module Plaidio
  module Configure
    attr_writer :customer_id, :secret, :public_key

    KEYS = [:customer_id, :secret, :public_key]

    def config
      yield self
      self
    end

  end
end
