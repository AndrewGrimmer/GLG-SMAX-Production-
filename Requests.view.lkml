view: Requests {
  sql_table_name: view_222219455.request ;;

  dimension: ID {
    description: "Ticket ID"
    value_format: "0"
    primary_key: yes
    type: number
    drill_fields: [ID]
    sql: ${TABLE}."ID" ;;
  }

  dimension: ASSIGNEDTOPERSON {
    description: "Assignee ID"
    value_format: "0"
    type: number
    sql: ${TABLE}."ASSIGNEDTOPERSON" ;;
  }

  dimension: ASSIGNEDTOGROUP {
    description: "Assignement Group"
    type: string
    sql: ${TABLE}."ASSIGNEDTOGROUP" ;;
  }

  dimension: URGENCY {
    description: "Urgency"
    type: string
    sql: ${TABLE}."URGENCY" ;;
  }

  dimension: CREATETIME {
    #label: "Time Opened"
    type: date
    sql: ${TABLE}."CREATETIME" ;;
  }

  dimension: CLOSETIME {
    #label: "Time Closed"
    type: date
    sql: ${TABLE}."CLOSETIME" ;;
  }

  dimension: PRIORITY{
    label: "Priority"
    type:  string
    sql: ${TABLE}."PRIORITY" ;;
  }

  dimension: PHASEID {
    label: "Workflow Phase"
    type: string
    sql: ${TABLE}."PHASEID" ;;
  }

  dimension: STATUS {
    type: string
    sql: CASE WHEN RIGHT(${TABLE}."STATUS", 2) NOT LIKE '_C' THEN SUBSTRING(${TABLE}."STATUS", 14) else SUBSTRING(${TABLE}."STATUS", 0, length(${TABLE}."STATUS")-1) end;;
  }

  dimension: LASTUPDATETIME{
    type:  date_minute
    sql: ${TABLE}."LASTUPDATETIME" ;;
  }

  dimension: isCurrentUpdate{
    type: yesno
    sql:  ${TABLE}."LASTUPDATETIME" <= now() AND ${TABLE}."LASTUPDATETIME" >= CURRENT_TIMESTAMP - INTERVAL '5 Days' ;;
  }
############### measure defintions ###############
  measure: URGENCYCOUNT {
    type: count
    drill_fields: [URGENCY]
  }
  measure: URGENCYSUM {
    type: count_distinct
    sql: ${TABLE}."URGENCY" ;;
    drill_fields: [URGENCYCOUNT]
  }
  measure: STATUSCOUNT {
    type: count
    drill_fields: [request_details*]
  }

  set: request_details {
    fields: [ID, CREATETIME, STATUS, ASSIGNEDTOPERSON, ASSIGNEDTOGROUP]
  }
}
