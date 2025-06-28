SELECT
	l.l_discount, o.o_orderpriority, c.c_mktsegment, s.s_nationkey, 
	COUNT(*) as group_count
FROM LineItem l, Orders o, Customer c, Supplier s
WHERE
	l.l_orderkey = o.o_orderkey
	AND o.o_custkey = c.c_custkey
	AND l.l_suppkey = s.s_suppkey
	AND l.l_quantity > 30
	AND round(o.o_totalprice) % 100 < 10
	AND c.c_nationkey % 5 = 0
GROUP BY
	l.l_discount, o.o_orderpriority, c.c_mktsegment, s.s_nationkey
