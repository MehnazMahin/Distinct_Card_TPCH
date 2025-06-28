SELECT
	l.l_discount, o.o_orderdate, p.p_brand, p.p_size,
        COUNT(*) as group_count
FROM 
	LineItem l, Orders o, Part p
WHERE 
	l.l_orderkey = o.o_orderkey
	AND p.p_partkey = l.l_partkey
	AND l.l_returnflag = 'R'
	AND round(o.o_totalprice) % 100 < 10
GROUP BY 
	l.l_discount, o.o_orderdate, p.p_brand, p.p_size
