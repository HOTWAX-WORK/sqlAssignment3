select
	p.PRODUCT_ID,
	p.PRODUCT_NAME,
	COUNT(distinct pf.FACILITY_ID) as FACILITY_COUNT,
	GROUP_CONCAT(distinct pf.FACILITY_ID order by pf.FACILITY_ID) as FACILITY_IDS
from
	product p
join
    product_facility pf on
	p.PRODUCT_ID = pf.PRODUCT_ID
where
	pf.FACILITY_ID is not null
group by
	p.PRODUCT_ID,
	p.PRODUCT_NAME;

