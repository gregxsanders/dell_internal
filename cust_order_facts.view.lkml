view: cust_order_facts {
  derived_table: {
  sql: SELECT
    customerid as customerid,
    COUNT(*) as lifetime_orders,
    MAX(orders.orderdate) as most_recent_purchase_at
       FROM orders
       GROUP BY customerid
       ;;
   }

  dimension: cust_id {
    primary_key: yes
    description: "Unique ID for each user that has ordered"
    hidden: yes
    type: number
    sql: ${TABLE}.customerid ;;
  }

  dimension: lifetime_orders {
    description: "The total number of orders for each user"
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension_group: most_recent_purchase {
    description: "The date when each user last ordered"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.most_recent_purchase_at ;;
  }

  measure: total_lifetime_orders {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${lifetime_orders} ;;
  }
  measure: average_lifetime_orders {
    type: average
    sql: ${lifetime_orders} ;;
  }
}
