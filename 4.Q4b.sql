SELECT 
	l.l_discount, o.o_orderpriority, c.c_mktsegment, n.n_name,
	COUNT(*) as group_count
FROM LineItem l, Orders o, Customer c, Nation n
WHERE 
	l.l_orderkey = o.o_orderkey
	AND o.o_custkey = c.c_custkey 
	AND c.c_nationkey = n.n_nationkey
	AND l.l_quantity > 30
	AND round(o.o_totalprice) % 100 = 0
	AND n.n_regionkey % 2 = 1
GROUP BY 
	l.l_discount, o.o_orderpriority, c.c_mktsegment, n.n_name
