-- 2 Completed Return Items
-- Business Problem:
-- Customer service and finance often need insights into returned items to manage refunds, replacements, and inventory restocking.

-- Fields to Retrieve:

-- RETURN_ID
-- ORDER_ID
-- PRODUCT_STORE_ID
-- STATUS_DATETIME
-- ORDER_NAME
-- FROM_PARTY_ID
-- RETURN_DATE
-- ENTRY_DATE
-- RETURN_CHANNEL_ENUM_ID

select
	ri.RETURN_ID ,
	ri.ORDER_ID ,
	oh.PRODUCT_STORE_ID ,
	rs.STATUS_DATETIME ,
	oh.ORDER_NAME ,
	rh.FROM_PARTY_ID ,
	rh.ENTRY_DATE as RETURN_DATE,
	oh.ENTRY_DATE ,
	rh.RETURN_CHANNEL_ENUM_ID 
from
	return_item ri
left join return_header rh on
	ri.RETURN_ID = rh.RETURN_ID
join order_header oh on
	oh.ORDER_ID = ri.ORDER_ID
join return_status rs on
	ri.RETURN_ID = rs.RETURN_ID 
	and ri.STATUS_ID =rs.STATUS_ID 
	and ri.RETURN_ITEM_SEQ_ID  = rs.RETURN_ITEM_SEQ_ID 
order by return_id ;  
