SELECT
	n.n_regionkey, o.o_orderstatus, o.o_orderpriority,
	COUNT(*) as group_count
FROM 
	LineItem l, Orders o, Customer c, Supplier s, Nation n
WHERE
	l.l_orderkey = o.o_orderkey
	AND o.o_custkey = c.c_custkey  
	AND s.s_nationkey = n.n_nationkey
	AND l.l_suppkey = s.s_suppkey
	AND l.l_shipdate < l.l_receiptdate
	AND round(o.o_totalprice) % 100 < 10
	AND c.c_nationkey > 10 AND c.c_nationkey < 15
	AND c.c_mktsegment IN ('MACHINERY', 'BUILDING')
GROUP BY
	n.n_regionkey, o.o_orderstatus, o.o_orderpriority
