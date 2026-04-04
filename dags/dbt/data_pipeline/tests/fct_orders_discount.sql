-- we are checking here if discounted price is 0 or greater which ensures that the entry is valid because negative discount means we are paying money instead.

select 
*
from 
   {{ref('fct_orders') }} 
where 
    item_discount_amount > 0