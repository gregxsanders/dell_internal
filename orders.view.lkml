view: orders {
  sql_table_name: public.orders ;;

  dimension: orderid {
    primary_key: yes
    type: number
    sql: ${TABLE}.orderid ;;
  }

  dimension: customerid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.customerid ;;
  }

  dimension: netamount {
    type: number
    sql: ${TABLE}.netamount ;;
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

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: totalamount {
    type: number
    sql: ${TABLE}.totalamount ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      orderid,
      customers.username,
      customers.customerid,
      customers.firstname,
      customers.lastname,
      cust_hist.count,
      orderlines.count
    ]
  }
}
