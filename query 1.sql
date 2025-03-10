	-- 1 Completed Sales Orders (Physical Items)
	-- Business Problem:
	-- Merchants need to track only physical items (requiring shipping and fulfillment) for logistics and shipping-cost analysis.
	
	-- Fields to Retrieve:
	
	-- ORDER_ID
	-- ORDER_ITEM_SEQ_ID
	-- PRODUCT_ID
	-- PRODUCT_TYPE_ID
	-- SALES_CHANNEL_ENUM_ID
	-- ORDER_DATE
	-- ENTRY_DATE
	-- STATUS_ID
	-- STATUS_DATETIME
	-- ORDER_TYPE_ID
	-- PRODUCT_STORE_ID

select
	oh.ORDER_ID ,
	oi.ORDER_ITEM_SEQ_ID ,
	p.PRODUCT_ID ,
	p.PRODUCT_TYPE_ID ,
	oh.SALES_CHANNEL_ENUM_ID ,
	oh.ORDER_DATE ,
	oh.ENTRY_DATE ,
	oh.status_id,
	os.STATUS_DATETIME ,
	oh.ORDER_TYPE_ID ,
	oh.PRODUCT_STORE_ID
from
(select * from order_header  where STATUS_ID not in ('ORDER_COMPLETED','ORDER_CANCELLED'))	as oh
left join order_status os on
	OH.ORDER_ID = OS.ORDER_ID
	and oh.STATUS_ID = os.STATUS_ID
join order_item oi on
	oi.ORDER_ID = oh.ORDER_ID 
join product p on
	OI.PRODUCT_ID = P.PRODUCT_ID
join product_type pt on
	pt.PRODUCT_TYPE_ID = p.PRODUCT_TYPE_ID
	and pt.IS_PHYSICAL = 'Y'


