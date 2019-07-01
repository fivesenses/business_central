# business-central

[![Build Status](https://dev.azure.com/fivesenses/business-central/_apis/build/status/fivesenses.business_central?branchName=master)](https://dev.azure.com/fivesenses/business-central/_build/latest?definitionId=3&branchName=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/f6fbe96abdd5ea3e9406/maintainability)](https://codeclimate.com/github/fivesenses/business-central/maintainability)

A Ruby library that provides access to the Microsoft Dynamics365 Business Central REST API.

Currently targets v1.0 of the API as documented here:

https://docs.microsoft.com/en-us/dynamics-nav/api-reference/v1.0/


## Installation

With bundler, add the following to your Gemfile

```
gem 'business_central'
```

## Usage

First, you need to create an instance of the BusinessCentral::Client, which is
then passed to one of the API query objects.

The gem currently only supports BasicAuthentication. The API supports both
BasicAuth and OAuth2.

Best practice is to store all client login details in environment variables.
The gem will automatically look for the following ENV variables, but these can
be over-ridden in the options Hash:

```
BC_TENANT, BC_COMPANY_ID, BC_USERNAME, BC_PASSWORD, BC_HOST
```

```
client = BusinessCentral::Client.new({
  api_tenant: ENV[BC_TENANT],
  api_username: ENV[BC_USERNAME],
  api_password: ENV[BC_PASSWORD],
  api_version: ENV[BC_API_VERSION],
  api_path: ENV[BC_API_PATH],
  api_company_id: ENV[BC_COMPANY_ID],
  api_host: ENV[BC_HOST]
})

# These options are used to build the URL to access the Business Central API as
# follows:

"https://#{@api_host}#{@api_version}/#{@api_tenant}#{@api_path}/companies(#{@api_company_id})"

"https://api.businesscentral.dynamics.com/v1.0/cronus.com/api/v1.0/companies(UUID)"

# Returns an array of Customers
customers = BusinessCentral::Customer.new(client).get()

# Returns an individual Customer
customer = BusinessCentral::Customer.new(client).get("CUSTOMER_ID")

# POST a new Customer
data = {
  displayName: "Company Name",
  number: "10000",
  type: "Company",
  ...
}

customer = BusinessCentral::Customer.new(client).post(data)

# Displays "Company Name"
puts customer.displayName

```

