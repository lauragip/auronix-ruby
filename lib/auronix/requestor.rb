require 'faraday'
require 'base64'

module Auronix
  class Requestor
    attr_reader :api_key

    def initialize
      @api_key = Auronix.api_key
    end

    def api_url(_url='')
      api_base = Auronix.api_base
      api_base + _url
    end

    def request(meth, _url, params = nil)
      _url = self.api_url(_url)
      meth = meth.downcase

      begin
        connection = build_connection(_url, params)
        response = connection.method(meth).call do |req|
          (if meth == :get then req.params = params else req.body = params.to_json end) if params
        end
      rescue Exception => e
        raise Error.error_handler({}, nil)
      end

      json_response = JSON.parse(response.body)
      raise Error.error_handler(json_response, response.status) if response.status != 200
      json_response
    end

    private

    def build_connection(_url, params = nil)
      connection = Faraday.new(
        :url => _url
      ) do |faraday|
        faraday.adapter  Faraday.default_adapter
      end

      set_headers_for(connection)
      return connection
    end

    def set_headers_for(connection)
      connection.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      connection.headers['User-Agent'] = 'Auronix/v0.0.1 RubyBindings/' + Auronix::VERSION
      return connection
    end

    def auronix_headers
      params = {
        bindings_version: Auronix::VERSION
      }

      params.merge!(plugin: Auronix.plugin) if Auronix.plugin.to_s.length > 0

      @auronix_headers ||= params
    end
  end
end

