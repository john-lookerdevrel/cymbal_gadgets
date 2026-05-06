include: "/views/product_reviews.view.lkml"
include: "/views/product_information.view.lkml"

explore: product_reviews {
  label: "🛍️ Cymbal Gadgets: Product Reviews "
  description: "Core explore for analyzing product reviews."

  always_filter: {
    filters: [
      product_reviews.reviewdate_date: "7 days"
    ]
  }

  join: product_information {
    view_label: "Product Reviews"
    type: left_outer
    relationship: many_to_one
    sql_on: ${product_reviews.productid} = ${product_information.productid} ;;
  }

}
