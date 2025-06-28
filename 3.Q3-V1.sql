SELECT
	c.c_nationkey, o.o_orderstatus, o.o_orderpriority,
	COUNT(*) as order_count
FROM LineItem l, Orders o, Customer c
WHERE 
	l.l_orderkey = o.o_orderkey
	AND c.c_custkey = o.o_custkey
	AND c.c_mktsegment = 'BUILDING'
	AND o.o_orderdate < '1995-03-15'
	AND l.l_shipdate > '1995-03-15'
GROUP BY 
	c.c_nationkey, o.o_orderstatus, o.o_orderpriority
