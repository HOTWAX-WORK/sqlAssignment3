select
	person.PARTY_ID ,
	ri.ORDER_ID ,
	person.FIRST_NAME
from
	return_item ri
join return_header rh on
	rh.RETURN_ID = ri.RETURN_ID
join person on
	rh.FROM_PARTY_ID = person.PARTY_ID
group by
	ri.ORDER_ID ,
	person.PARTY_ID
having
	COUNT(ri.RETURN_ID) = 1;
