connection: "greenlight_smax_aws"

include: "*.view.lkml"

explore:Requests {
  join: person{
    type: left_outer
    sql_on: ${Requests.ASSIGNEDTOPERSON} = ${person.id} ;;
    relationship: one_to_one
  }
  join: group {
    type: left_outer
    sql_on: ${Requests.ASSIGNEDTOGROUP} = ${group.ID}  ;;
    relationship: one_to_one
  }
}

explore: person {}

explore: group {}

explore: incident {
  join: person{
    type: left_outer
    sql_on: ${incident.ASSIGNEDPERSON} = ${person.id} ;;
    relationship: one_to_one
  }
  join: group {
    type: left_outer
    sql_on: ${incident.ASSIGNEDGROUP} = ${group.ID}  ;;
    relationship: one_to_one
  }
}
