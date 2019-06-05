view: person {
  sql_table_name: view_222219455.person ;;

  dimension: id {
    primary_key: yes
    hidden:  yes
    type:  number
    sql:  ${TABLE}."ID" ;;
  }
  dimension: Name {
    type:  string
    sql: ${TABLE}."NAME" ;;
  }
  dimension: COMPANY {
    type:  number
    sql:  ${TABLE}."COMPANY" ;;
  }
}
