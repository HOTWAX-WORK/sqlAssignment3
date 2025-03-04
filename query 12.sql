-- 12 Orders Without Picklist
-- Business Problem:
-- A picklist is necessary for warehouse staff to gather items. Orders missing a picklist might be delayed and need attention.

-- Fields to Retrieve:

-- ORDER_ID
-- ORDER_DATE
-- ORDER_STATUS
-- FACILITY_ID
-- DURATION (How long has the order been assigned at the facility)

SELECT
    distinct os.ORDER_ID,
    oh.ORDER_DATE ,
    oh.STATUS_ID as ORDER_STATUS,
    S.ORIGIN_FACILITY_ID ,
    ofc.CHANGE_DATETIME 
FROM
    order_shipment os
LEFT JOIN
    picklist_bin pb ON os.ORDER_ID = pb.primary_order_id
left join order_header oh on oh.ORDER_ID = os.ORDER_ID 
left join shipment s on S.SHIPMENT_ID =OS.SHIPMENT_ID 
left join order_facility_change ofc on ofc.ORDER_ID = os.ORDER_ID 
WHERE
    pb.primary_order_id IS null
order by os.ORDER_ID
