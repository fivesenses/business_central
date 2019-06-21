require 'test_helper'

class BusinessCentral::CountriesRegionTest < Test::Unit::TestCase
  def test_initialize
    api_country = BusinessCentral::CountriesRegion.new(bc_client)
    assert_not_nil api_country
  end

  def test_get_country_region
    stub_get("countriesRegions(1234)").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_countries_region_success.json"))

    country = BusinessCentral::CountriesRegion.new(bc_client).get("1234")
    assert_equal "Australia", country.displayName
  end

  def test_get_countries_regions
    stub_get("countriesRegions").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_countries_regions_success.json"))

    countries = BusinessCentral::CountriesRegion.new(bc_client).get()
    assert countries.length > 0
  end

  def test_patch_countries_region
    data = { displayName: "AustraliaFeet" }
    etag = "W/\"JzQ0OzVWd1JHeEdVQ0p3bkZTVWhQMVlsakhYcDdLRmxwUDJQV1BxWERkdWNtbEk9MTswMDsn\""

    stub_patch("countriesRegions(1234)").
      with(headers: stub_headers.merge({'If-Match'=>etag}), body: data).
      to_return(status: 200, body: fixture("patch_countries_region_success.json"))

    country = BusinessCentral::CountriesRegion.new(bc_client).
      update("1234", etag, data)

    assert_equal "AustraliaFeet", country.displayName
  end

  def test_create_countries_region
    stub_post("countriesRegions").
      with(headers: stub_headers, body: new_country_region).
      to_return(status: 201, body: fixture("post_countries_region_success.json"))

    country = BusinessCentral::CountriesRegion.new(bc_client).
      create(new_country_region)

    assert_equal "Chicken Feet", country.displayName
  end

  def test_delete_countries_region
    etag = "W/\"JzQ0OzVWd1JHeEdVQ0p3bkZTVWhQMVlsakhYcDdLRmxwUDJQV1BxWERkdWNtbEk9MTswMDsn\""

    stub_delete("countriesRegions(1234)").
      with(headers: stub_headers.merge({'If-Match'=>etag})).
      to_return(status: 204)

    assert_equal "204", BusinessCentral::CountriesRegion.new(bc_client).delete("1234", etag)
  end

  def new_country_region
    {
      "code": "CF",
      "displayName": "Chicken Feet",
      "addressFormat": "City+County+State+Post Code"
    }
  end
end
