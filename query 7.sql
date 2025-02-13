select
	COUNT(oisg.SHIPMENT_METHOD_TYPE_ID) as TOTAL_ONE_DAY_SHIP_ORDERS,
	oisg.FACILITY_ID,
	f.FACILITY_NAME,
	DATE_FORMAT(CURRENT_DATE - interval 1 month, '%Y-%m') as REPORTING_PERIOD
from
	order_item_ship_group oisg
join
    facility f on
	oisg.FACILITY_ID = f.FACILITY_ID
	and oisg.SHIPMENT_METHOD_TYPE_ID = 'NEXT_DAY'
where
	month(oisg.created_stamp) = month(CURRENT_DATE - interval 1 month)
	and year(oisg.created_stamp) = year(CURRENT_DATE)
group by
	oisg.FACILITY_ID
order by
	TOTAL_ONE_DAY_SHIP_ORDERS desc
limit 1;

