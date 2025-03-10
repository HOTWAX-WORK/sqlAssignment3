-- 10 Total Items in Various Virtual Facilities
-- Business Problem:
-- Retailers need to study the relation of inventory levels of products to the type of facility it's stored at. Retrieve all inventory levels for products at locations and include the facility type Id. Do not retrieve facilities that are of type Virtual.

-- Fields to Retrieve:

-- PRODUCT_ID
-- FACILITY_ID
-- FACILITY_TYPE_ID
-- QOH (Quantity on Hand)
-- ATP (Available to Promise)


select
ii.INVENTORY_ITEM_ID ,
	ii.PRODUCT_ID ,
	ii.FACILITY_ID ,
	f.FACILITY_TYPE_ID ,
	ft.PARENT_TYPE_ID ,
	ii.QUANTITY_ON_HAND_TOTAL ,
	ii.AVAILABLE_TO_PROMISE_TOTAL
from
	inventory_item ii
join 
	facility f on f.FACILITY_ID = ii.FACILITY_ID
join 
facility_type ft on 
	f.FACILITY_TYPE_ID = ft.FACILITY_TYPE_ID
	and (ft.PARENT_TYPE_ID = 'VIRTUAL_FACILITY'
		or F.FACILITY_TYPE_ID = 'VIRTUAL_FACILITY')



