SELECT
	n.n_name, o.o_orderpriority, c.c_mktsegment,
	sum(l.l_extendedprice * (1 - l.l_discount)) as revenue
FROM Customer c, Orders o, LineItem l, Supplier s, Nation n, Region r
WHERE
	c.c_custkey = o.o_custkey
	AND l.l_orderkey = o.o_orderkey
	AND l.l_suppkey = s.s_suppkey
	AND c.c_nationkey = s.s_nationkey
	AND s.s_nationkey = n.n_nationkey
	AND n.n_regionkey = r.r_regionkey
	AND o.o_orderdate >= '1994-01-01'
	AND o.o_orderdate < '1995-01-01'
GROUP BY
	n.n_name, o.o_orderpriority, c.c_mktsegment
