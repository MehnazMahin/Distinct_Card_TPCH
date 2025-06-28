SELECT
	supp_nation, cust_nation, l_year, sum(volume) as revenue
FROM (
	SELECT
		n1.n_name as supp_nation,
		n2.n_name as cust_nation,
		`get-year`(l.l_shipdate) as l_year,
		l.l_extendedprice * (1 - l.l_discount) as volume
	FROM Supplier s, LineItem l, Orders o, Customer c, Nation n1, Nation n2
	WHERE
		s.s_suppkey = l.l_suppkey
		AND o.o_orderkey = l.l_orderkey
		AND c.c_custkey = o.o_custkey
		AND s.s_nationkey = n1.n_nationkey
		AND c.c_nationkey = n2.n_nationkey
		AND (
			(n1.n_name = 'GERMANY' AND n2.n_name = 'FRANCE') OR
			(n1.n_name = 'FRANCE' AND n2.n_name = 'GERMANY')
		)
		AND l.l_shipdate >= '1995-01-01' AND l.l_shipdate <= '1996-12-31'
	) as shipping
GROUP BY
	supp_nation, cust_nation, l_year
