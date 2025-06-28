SELECT
	nation, customer, o_year, sum(amount) as sum_profit
FROM (
	SELECT
		n.n_name as nation,
		o.o_custkey as customer,
		`get-year`(o.o_orderdate) as o_year,
		l.l_extendedprice * (1 - l.l_discount) - ps.ps_supplycost * l.l_quantity as amount
	FROM Part p, Supplier s, LineItem l, Partsupp ps, Orders o, Nation n
	WHERE
		s.s_suppkey = l.l_suppkey
		AND ps.ps_suppkey = l.l_suppkey
		AND ps.ps_partkey = l.l_partkey
		AND p.p_partkey = l.l_partkey
		AND o.o_orderkey = l.l_orderkey
		AND s.s_nationkey = n.n_nationkey
		AND p.p_name like '%green%'
	) as profit
GROUP BY
	nation, customer, o_year
