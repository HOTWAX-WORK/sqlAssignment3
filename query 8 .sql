-- 8 List of Warehouse Pickers
-- Business Problem:
-- Warehouse managers need a list of employees responsible for picking and packing orders to manage shifts, productivity, and training needs.

-- Fields to Retrieve:

-- PARTY_ID (or Employee ID)
-- NAME (First/Last)
-- ROLE_TYPE_ID (e.g., “WAREHOUSE_PICKER”)
-- FACILITY_ID (assigned warehouse)
-- STATUS (active or inactive employee)

select
	fp.FACILITY_ID,
	p.FIRST_NAME,
	pe.STATUS_ID,
	fp.PARTY_ID,
	fp.ROLE_TYPE_ID
from
	facility_party fp
left join
    person p on
	fp.PARTY_ID = p.PARTY_ID
left join
    party pe on
	fp.PARTY_ID = pe.PARTY_ID
where
	fp.ROLE_TYPE_ID in ('PICKER', 'PACKER', 'WAREHOUSE_PICKER', 'WAREHOUSE_PACKER');

