view: inventory {
  sql_table_name: public.inventory ;;

  dimension: prod_id {
    type: number
    sql: ${TABLE}.prod_id ;;
  }

  dimension: quan_in_stock {
    type: number
    sql: ${TABLE}.quan_in_stock ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.sales ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
