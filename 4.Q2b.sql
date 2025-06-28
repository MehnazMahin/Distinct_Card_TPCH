SELECT 
	l.l_quantity, o.o_orderpriority, c.c_nationkey,
	COUNT(*) as group_count
FROM LineItem l, Orders o, Customer c, Nation n
WHERE 
	l.l_orderkey = o.o_orderkey
	AND o.o_custkey = c.c_custkey 
	AND c.c_nationkey = n.n_nationkey
	AND l.l_returnflag = 'R'
	AND round(o.o_totalprice) % 100 < 10
	AND c.c_mktsegment = 'MACHINERY'
GROUP BY 
	l.l_quantity, o.o_orderpriority, c.c_nationkey
