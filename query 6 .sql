SELECT 
    ri.ORDER_ID,
    ri.RETURN_ID,
    rh.RETURN_DATE,
    ri.reason,
    ri.RETURN_QUANTITY ,
    grouped.NO_OF_RETURN
FROM 
    return_item ri
LEFT JOIN 
    return_header rh ON rh.RETURN_ID = ri.RETURN_ID
JOIN (
    SELECT 
        ri.ORDER_ID,
        ri.RETURN_ID,
        COUNT(ri.RETURN_ID) AS NO_OF_RETURN
    FROM 
        return_item ri
    GROUP BY 
        ri.ORDER_ID, ri.RETURN_ID
    HAVING 
        COUNT(ri.RETURN_ID) > 1
) grouped ON grouped.ORDER_ID = ri.ORDER_ID AND grouped.RETURN_ID = ri.RETURN_ID
