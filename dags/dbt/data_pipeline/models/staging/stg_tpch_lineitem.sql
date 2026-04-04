  --here we created a surrogate key which would be a combination of order_key and linenumber from orders table and linenumber table
select 
    {{

        dbt_utils.generate_surrogate_key([
            'l_orderkey',
            'l_linenumber'

        ]) 
    }} as order_item_key,

    l_orderkey as order_key,
    l_partkey as part_key,
    l_linenumber as line_number,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount_percentage,
    l_tax as tax_rate

from 
{{source('tpch','lineitem')}}