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
}
