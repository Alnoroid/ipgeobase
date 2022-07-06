# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_ip_api_must_be_available
    stub_request(:get, "http://[http//ip-api.com/xml/8.8.8.8%5D:80/").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: "", headers: {})

    Net::HTTP.get("http://ip-api.com/xml/8.8.8.8", "/")
  end

  def returned_data_sanity_test
    ip_meta = Ipgeobase.lookup('8.8.8.8')
    assert { ip_meta.city === 'Ashburn' }
  end
end
