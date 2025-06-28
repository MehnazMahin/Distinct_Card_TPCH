SELECT
	l.l_discount, o.o_orderstatus, c.c_nationkey, 
	COUNT(*) as group_count
FROM
	LineItem l, Orders o, Customer c
WHERE
	l.l_orderkey = o.o_orderkey
	AND o.o_custkey = c.c_custkey
	AND l.l_quantity > 30
	AND round(o.o_totalprice) % 100 < 10
	AND c.c_mktsegment = 'MACHINERY'
GROUP BY
	l.l_discount, o.o_orderstatus, c.c_nationkey
