view: orderlines {
  sql_table_name: public.orderlines ;;

  dimension: orderlineid {
    primary_key: yes
    type: number
    sql: ${TABLE}.orderlineid ;;
  }

  dimension_group: orderdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.orderdate ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.orderid ;;
  }

  dimension: prod_id {
    type: number
    sql: ${TABLE}.prod_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  measure: count {
    type: count
    drill_fields: [orderlineid, orders.orderid]
  }
}
