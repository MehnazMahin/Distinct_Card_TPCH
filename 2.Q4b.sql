SELECT
	l.l_shipmode, l.l_shipinstruct, o.o_orderstatus, COUNT(*) as group_count
FROM
	LineItem l, Orders o
WHERE
	l.l_orderkey = o.o_orderkey
	AND l.l_quantity % 5 = 0
	AND l.l_returnflag = 'R'
	AND round(o.o_totalprice) % 100 < 10
GROUP BY
	l.l_shipmode, l.l_shipinstruct, o.o_orderstatus
