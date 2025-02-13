select
	ii.ORDER_ID,
	it.FACILITY_ID ,
	it.FACILITY_ID_TO ,
	it.PRODUCT_ID ,
	ii.QUANTITY as REQUESTED_QUANTITY,
	it.SEND_DATE ,
	it.STATUS_ID
from
	inventory_transfer it
join item_issuance ii on
	ii.ITEM_ISSUANCE_ID = it.ITEM_ISSUANCE_ID
