view: incident {
  sql_table_name: view_222219455.incident ;;

  dimension: ID {
    label: "Ticket ID"
    value_format: "0"
    primary_key: yes
    type: number
    drill_fields: [request_details*]
    sql: ${TABLE}."ID" ;;
  }

  dimension: ASSIGNEDPERSON {
    label: "Assignee ID"
    value_format: "0"
    type: number
    sql: ${TABLE}."ASSIGNEDPERSON" ;;
  }

  dimension: ASSIGNEDGROUP {
    description: "Assignement Group"
    type: string
    sql: ${TABLE}."ASSIGNEDGROUP" ;;
  }

  dimension: URGENCY {
    description: "Urgency"
    type: string
    sql: ${TABLE}."URGENCY" ;;
  }

  dimension:LASTUPDATETIME {
    label: "Last Update Time"
    type: date_hour
    sql: ${TABLE}."LASTUPDATETIME" ;;
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
    sql: ${TABLE}."STATUS" ;;
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
    fields: [ID, LASTUPDATETIME, STATUS, ASSIGNEDPERSON, ASSIGNEDGROUP]
  }
}
