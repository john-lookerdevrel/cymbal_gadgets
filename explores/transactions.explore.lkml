include: "/views/transactions.view.lkml"
include: "/views/product_metrics.view.lkml"
include: "/views/marketing_campaign_impact.view.lkml"

explore: transactions {
  label: "🛍️ Cymbal Gadgets: Transactions & Sales"
  description: "Core explore for analyzing transactions, marketing impact, and product reviews."

  always_filter: {
    filters: [
      transactions.transaction_date: "7 days"
    ]
  }

  join: product_metrics {
    sql_on: ${transactions.productid} = ${product_metrics.productid} ;;
    relationship: many_to_one
  }

  join: marketing_campaign_impact {
    sql_on: ${transactions.salesid} = ${marketing_campaign_impact.salesid} ;;
    relationship: one_to_many
  }

}
