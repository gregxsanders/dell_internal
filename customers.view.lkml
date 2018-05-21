view: customers {
  sql_table_name: public.customers ;;

  dimension: customerid {
    primary_key: yes
    type: number
    sql: ${TABLE}.customerid ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: creditcard {
    type: string
    sql: ${TABLE}.creditcard ;;
  }

  dimension: creditcardexpiration {
    type: string
    sql: ${TABLE}.creditcardexpiration ;;
  }

  dimension: creditcardtype {
    type: number
    sql: ${TABLE}.creditcardtype ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: income {
    type: number
    sql: ${TABLE}.income ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: region {
    type: number
    sql: ${TABLE}.region ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      customerid,
      username,
      firstname,
      lastname,
      cust_hist.count,
      orders.count
    ]
  }
}
