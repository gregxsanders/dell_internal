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
    group_label: "Contact"
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
    group_label: "Contact"
    }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    label: "Age Tier"
    type: tier
    tiers: [10,20,30,40,50,60,70,80]
    style: integer
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    group_label: "Contact"
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    group_label: "Contact"
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
    group_label: "Contact"
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    group_label: "Contact"
  }

  dimension: creditcard {
    type: string
    sql: ${TABLE}.creditcard ;;
    group_label: "Credit Card"
  }

  dimension: creditcardexpiration {
    type: string
    sql: ${TABLE}.creditcardexpiration ;;
    group_label: "Credit Card"
  }

  dimension: creditcardtype {
    type: number
    sql: ${TABLE}.creditcardtype ;;
    group_label: "Credit Card"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    group_label: "Contact"
  }

  dimension: firstname {
    label: "First Name"
    type: string
    sql: ${TABLE}.firstname ;;
    group_label: "Name"
  }

  dimension: lastname {
    label: "Last Name"
    type: string
    sql: ${TABLE}.lastname ;;
    group_label: "Name"
  }

  dimension: fullname {
    label: " Full Name"
    type: string
    sql: ${firstname} || ' ' || ${lastname}  ;;
    group_label: "Name"
  }


  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: income {
    type: number
    sql: ${TABLE}.income ;;
  }



  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
    group_label: "Contact"
  }

  dimension: region {
    type: number
    sql: ${TABLE}.region ;;
  }


  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
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
