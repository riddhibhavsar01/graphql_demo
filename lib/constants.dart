


const String readCapsules = """ 	
query ProductSearch(\$search: String!, \$pageSize: Int!, \$currentPage: Int!,
  ){
    products(
        search: \$search
      
       pageSize: \$pageSize
     
       currentPage: \$currentPage
    ) {
        total_count
        items {
            name
            categories {
                uid
                name
                path
            }
            image {
                url
                label
            }
            sku
            price_range {
                minimum_price {
                    regular_price {
                        value
                        currency
                    }
                    final_price {
                        value
                        currency
                    }
                    discount {
                        amount_off
                        percent_off
                    }
                }
                maximum_price {
                    regular_price {
                        value
                        currency
                    }
                    final_price {
                        value
                        currency
                    }
                    discount {
                        amount_off
                        percent_off
                    }
                }
            }
        }
        page_info {
            page_size
            current_page
        }
    }
}""";


const String registerUser = """mutation CreateCustomer(\$email : String!,\$password: String!,\$firstname : String!,\$lastname: String!){
  createCustomer(
    input: {
      firstname: \$firstname
      lastname: \$lastname
      email: \$email
      password: \$password
      is_subscribed: true
    }
  ) {
    customer {
      firstname
      lastname
      email
      is_subscribed
    }
  }
}
 """;

const String generateToken = """mutation GenerateCustomerToken(\$email : String!,\$password : String!){
  generateCustomerToken(
    email: \$email
    password: \$password
  ) {
    token
  }
}""";
/*
const String fetchUser = """{
  customer {
    firstname
    lastname
    suffix
    email
    dob
    gender
    addresses {
        id
      firstname
      lastname
      street
      city
      telephone
      region {
        region_code
        region
      }
      postcode
      country_code
      telephone
      default_shipping
    default_billing
    }
  }
}""";*/

const fetchUser= """{
  products(filter: { sku: { eq: "demo2122" } }) {
    items {
      id
      attribute_set_id
      name
      sku
     short_description{
      html
  }
  description{
      html
  }
      reviews{
          review_items{
              review_id
              created_at
              title
              detail
              nickname
              rating_value
          }
          review_count
      }
      avg_reviews
      image {
        url
        label
      }
      small_image {
        url
        label
      }
      thumbnail {
        label
        url
     }
     media_gallery {
          url
          ... on ProductVideo {
              video_content {
                  media_type
                  video_provider
                  video_url
                  video_title
                  video_description
                  video_metadata
              }
          }
      }
      __typename
      price_range{
        minimum_price{
          regular_price{
            value
            currency
          }
        }
      }
      categories {
        id
      }
      ... on ConfigurableProduct {
        configurable_options {
          id
          attribute_id
          label
          position
          use_default
          attribute_code
          values {
            value_index
            label
            swatch_data{
              value
            }
          }
          product_id
        }
        variants {
          product {
            id
            name
            sku
            attribute_set_id
            ... on PhysicalProductInterface {
              weight
            }
            price_range{
              minimum_price{
                regular_price{
                  value
                  currency
                }
              }
            }
          }
          attributes {
            label
            code
            value_index
          }
        }
        related_products {  
        id
        sku
        name
        short_description {
          html
        }
        image{
          url
          label
          position
        }
         small_image{
          url
          label
          position
        }
        thumbnail{
          url
          label
          position
        }
        url_key
        name
        special_price
        price_range {
          minimum_price {
            final_price {
              value
              currency
            }
          }
          maximum_price {
            final_price {
              value
              currency
            }
          }
        }
      }
      }
    }
  }
}""";
