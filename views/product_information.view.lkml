include: "/explores/transactions.explore.lkml"

view: product_information {
  derived_table: {
    explore_source: transactions {
      column: brand {}
      column: category {}
      column: productname {}
      column: productid {}
      filters: {
        field: transactions.transaction_date
        value: "NOT NULL"
      }
    }
  }
  dimension: brand {
    group_label: "Product"
    type: string
  }
  dimension: category {
    group_label: "Product"
    type: string
  }
  dimension: productname {
    group_label: "Product"
    label: "Product Name"
  }
  dimension: productid {
    hidden: yes
    primary_key: yes
  }
}
