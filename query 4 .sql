select
	count(ri.RETURN_ITEM_SEQ_ID),
	sum(ri.RETURN_PRICE*ri.RETURN_QUANTITY) as RETURN_TOTAL,
	count(ra.RETURN_ADJUSTMENT_ID ) as TOTAL_APPEASEMENT
	,sum(ra.AMOUNT )as APPEASEMENT_AMOUNT_TOTAL
from
	return_header rh
left join return_item ri on rh.RETURN_ID = ri.RETURN_ID   
left join return_adjustment ra on
	ra.RETURN_ID  = rh.RETURN_ID
	and ra.RETURN_ADJUSTMENT_TYPE_ID = 'APPEASEMENT' 
