include: "/explores/product_reviews.explore.lkml"

view: product_metrics {
  view_label: "Transactions"

  derived_table: {
    explore_source: product_reviews {
      column: productid {}
      column: average_rating {}
      column: count {}
      column: count_positive_reviews {}
      bind_filters: {
        from_field: transactions.transaction_date
        to_field: product_reviews.reviewdate_date
      }
    }
  }

  dimension: productid {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.productid ;;
  }

  dimension: average_rating {
    group_label: "Product Info"
    description: "The average customer rating for the product."
    type: number
    sql: ${TABLE}.average_rating ;;
    value_format_name: decimal_2
  }

  dimension: count {
    group_label: "Product Info"
    label: "Total Reviews"
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: count_positive_reviews {
    group_label: "Product Info"
    label: "Total Positive Reviews"
    description: "Count of reviews with a rating of 4 or 5."
    type: number
    sql: ${TABLE}.count_positive_reviews ;;
  }
}
