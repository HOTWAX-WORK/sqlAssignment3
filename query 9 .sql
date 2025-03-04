-- 9 Total Facilities That Sell the Product
-- Business Problem:
-- Retailers want to see how many (and which) facilities (stores, warehouses, virtual sites) currently offer a product for sale.

-- Fields to Retrieve:

-- PRODUCT_ID
-- PRODUCT_NAME (or INTERNAL_NAME)
-- FACILITY_COUNT (number of facilities selling the product)
-- (Optionally) a list of FACILITY_IDs if more detail is needed

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

