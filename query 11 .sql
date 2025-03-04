-- 11 Transfer Orders Without Inventory Reservation
-- Business Problem:
-- When transferring stock between facilities, the system should reserve inventory. If it isn’t reserved, the transfer may fail or oversell.

-- Fields to Retrieve:

-- TRANSFER_ORDER_ID
-- FROM_FACILITY_ID
-- TO_FACILITY_ID
-- PRODUCT_ID
-- REQUESTED_QUANTITY
-- RESERVED_QUANTITY
-- TRANSFER_DATE
-- STATUS


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
