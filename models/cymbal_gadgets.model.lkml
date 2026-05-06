connection: "cymbal_gadgets"

include: "/explores/*"
include: "/dashboards/*"

datagroup: cymbal_gadgets_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: cymbal_gadgets_default_datagroup
