select
	rh.RETURN_ID ,
	rh.ENTRY_DATE ,
	ra.RETURN_ADJUSTMENT_TYPE_ID ,
	ra.AMOUNT ,
	ra.COMMENTS ,
	ri.ORDER_ID ,
	oh.ORDER_DATE ,
	rh.RETURN_DATE ,
	oh.PRODUCT_STORE_ID
from
	return_header rh
left join return_adjustment ra on
	ra.RETURN_ID = rh.RETURN_ID
left join return_item ri on
	ri.RETURN_ID = ra.RETURN_ID
left join order_header oh on
	oh.ORDER_ID = ri.ORDER_ID
