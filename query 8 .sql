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

