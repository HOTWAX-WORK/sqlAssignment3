SELECT
    distinct os.ORDER_ID,
    oh.ORDER_DATE ,
    oh.STATUS_ID as ORDER_STATUS,
    S.ORIGIN_FACILITY_ID 
FROM
    order_shipment os
LEFT JOIN
    picklist_bin pb ON os.ORDER_ID = pb.primary_order_id
left join order_header oh on oh.ORDER_ID = os.ORDER_ID 
left join shipment s on S.SHIPMENT_ID =OS.SHIPMENT_ID 
WHERE
    pb.primary_order_id IS null
order by os.ORDER_ID 

