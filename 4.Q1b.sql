SELECT 
	l.l_shipinstruct, o.o_orderpriority, o.o_orderstatus, n.n_regionkey,
	COUNT(*) as group_count
FROM LineItem l, Orders o, Customer c, Nation n
WHERE 
	l.l_orderkey = o.o_orderkey
	AND o.o_custkey = c.c_custkey 
	AND c.c_nationkey = n.n_nationkey
	AND l.l_quantity % 5 = 0
	AND round(o.o_totalprice) % 100 < 10
	AND c.c_mktsegment IN ('MACHINERY', 'BUILDING')
GROUP BY 
	l.l_shipinstruct, o.o_orderpriority, o.o_orderstatus, n.n_regionkey
