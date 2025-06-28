SELECT
	l.l_shipmode, l.l_shipinstruct, o.o_orderdate, COUNT(*) as group_count
FROM
	LineItem l, Orders o
WHERE
	l.l_orderkey = o.o_orderkey
	AND l.l_quantity > 30
	AND round(o.o_totalprice) % 100 = 0
GROUP BY
	l.l_shipmode, l.l_shipinstruct, o.o_orderdate
