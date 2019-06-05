view: company {
  sql_table_name: view_222219455.company ;;

  dimension: id {
    primary_key: yes
    hidden:  yes
    type:  number
    sql:  ${TABLE}."ID" ;;
  }

  dimension: Name {
    description: "Company Name"
    type:  string
    sql: ${TABLE}."DISPLAYLABEL" ;;
  }
}
