SELECT
	l.l_discount, o.o_orderpriority, c.c_nationkey, COUNT(*) as group_count
FROM
	LineItem l, Orders o, Customer c
WHERE
	l.l_orderkey = o.o_orderkey
	AND o.o_custkey = c.c_custkey
	AND l.l_quantity > 30
	AND round(o.o_totalprice) % 100 < 10
GROUP BY
	l.l_discount, o.o_orderpriority, c.c_nationkey
