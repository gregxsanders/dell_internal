view: products {
  sql_table_name: public.products ;;

  dimension: actor {
    type: string
    sql: ${TABLE}.actor ;;
  }

  dimension: category {
    type: number
    sql: ${TABLE}.category ;;
  }

  dimension: common_prod_id {
    type: number
    sql: ${TABLE}.common_prod_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: prod_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prod_id ;;
  }

  dimension: special {
    type: number
    sql: ${TABLE}.special ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

parameter: price_metric_picker {
  description: "Use with price metric measure"
  type: unquoted
  allowed_value: {
    label: "Total Sale Price"
    value: "SUM"
  }
  allowed_value: {
    label: "Average Price"
    value: "AVG"
  }
  allowed_value: {
    label: "Max Price"
    value: "MAX"
  }
  allowed_value: {
    label: "Min Price"
    value: "MIN"
  }
}

measure: price_metric{
  description: "Use with the price metric picker filter-only field"
  type: number
  label_from_parameter: price_metric_picker
  sql: {% parameter price_metric_picker %}(${price}) ;;
  value_format_name: usd
}

#   measure: sale_price_metric {
#     description: "Use with the Sale Price Metric Picker filter-only field"
#     type: number
#     label_from_parameter: sale_price_metric_picker
#     sql: {% parameter sale_price_metric_picker %}(${sale_price}) ;;
#     value_format_name: usd
#   }
}
