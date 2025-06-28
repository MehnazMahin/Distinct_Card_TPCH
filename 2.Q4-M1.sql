SELECT
	o.o_orderpriority, 
	l.l_shipmode, l.l_shipinstruct,
	COUNT(*) as order_count
FROM Orders o, LineItem l
WHERE
	l.l_orderkey = o.o_orderkey
	AND l.l_commitdate < l.l_receiptdate
	AND o.o_orderdate >= '1993-07-01'
	AND o.o_orderdate < '1993-10-01'
GROUP BY
	o.o_orderpriority, l.l_shipmode, l.l_shipinstruct
