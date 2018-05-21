connection: "dell"

include: "*.view.lkml"         # include all views in this project

explore: orderlines {
  group_label: "eComm"
  label: "eComm Orders"
  join: orders {
    relationship: many_to_one
    sql_on: ${orderid} = ${orders.orderid} ;;
  }
  join: customers {
    relationship: many_to_one
    sql_on: ${customers.customerid} = ${orders.customerid} ;;
  }
  join: products {
    relationship: many_to_one
    sql_on: ${products.prod_id} = ${orderlines.prod_id} ;;
  }
  join: categories {
    relationship: many_to_one
    sql_on: ${categories.category} = ${products.category} ;;
  }
  join: inventory {
    relationship: many_to_one
    sql_on: ${inventory.prod_id} = ${orderlines.prod_id} ;;
  }
}
