include: "/views/transactions.view.lkml"
include: "/views/product_reviews.view.lkml"
include: "/views/marketing_campaign_impact.view.lkml"

explore: transactions {
  label: "🛍️ Cymbal Gadgets: Transactions & Sales"
  description: "Core explore for analyzing transactions, marketing impact, and product reviews."

  join: product_reviews {
    sql_on: ${transactions.productid} = ${product_reviews.productid} ;;
    relationship: many_to_many
  }
  join: marketing_campaign_impact {
    sql_on: ${transactions.salesid} = ${marketing_campaign_impact.salesid} ;;
    relationship: one_to_many
  }
}
