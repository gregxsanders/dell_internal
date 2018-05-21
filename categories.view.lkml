view: categories {
  sql_table_name: public.categories ;;

  dimension: category {
    primary_key: yes
    type: number
    sql: ${TABLE}.category ;;
  }

  dimension: categoryname {
    type: string
    sql: ${TABLE}.categoryname ;;
  }

  measure: count {
    type: count
    drill_fields: [categoryname]
  }
}
