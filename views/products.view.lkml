view: products {
  sql_table_name: demo_db2.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  #TESTING, STRING AND NUMBER
  dimension: catagory_without_special_chars{
    type: string
    sql: CASE WHEN ${category} LIKE '%a%' THEN 'a'
              WHEN ${category} LIKE '%e%' THEN 'b'
    ELSE 'other'
    END;;
  }

  dimension: catagory_with_special_chars_num{
    type: string
    sql: CASE WHEN ${category} LIKE '%a%' THEN '1% to 2%'
              WHEN ${category} LIKE '%e%' THEN '2% to 3%'
    ELSE "4%+"
    END;;
  }

  #TEST

  dimension: catagory_without_special_chars_num{
    type: string
    sql: CASE WHEN ${category} LIKE '%a%' THEN 1
              WHEN ${category} LIKE '%e%' THEN 2
    ELSE 3
    END;;
  }

  # CONTROL
  dimension: no_change_control{
    type: string
    sql: CASE WHEN ${category} LIKE '%a%' THEN 1
              WHEN ${category} LIKE '%e%' THEN 2
    ELSE 3
    END;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: retail_price_tier  {
    type: tier
    tiers:[10,20,30,40,50,60]
    style: relational
    sql: ${TABLE}.retail_price  ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
