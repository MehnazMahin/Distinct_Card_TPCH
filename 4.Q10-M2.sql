SELECT
	l.l_discount, l.l_shipinstruct, n.n_name,
	sum(l.l_extendedprice * (1 - l.l_discount)) as revenue
FROM
	Customer c, Orders o, LineItem l, Nation n
WHERE
	c.c_custkey = o.o_custkey
	AND l.l_orderkey = o.o_orderkey
	AND o.o_orderdate >= '1993-10-01'
	AND o.o_orderdate < '1994-01-01'
	AND l.l_returnflag = 'R'
	AND c.c_nationkey = n.n_nationkey
GROUP BY
	l.l_discount, l.l_shipinstruct, n.n_name
