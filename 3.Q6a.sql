SELECT
	l.l_discount, o.o_orderstatus, p.p_type,
	COUNT(*) as group_count
FROM 
	LineItem l, Orders o, Part p
WHERE 
	l.l_orderkey = o.o_orderkey
	AND p.p_partkey = l.l_partkey
	AND l.l_quantity > 30
	AND round(o.o_totalprice) % 100 < 10
GROUP BY 
	l.l_discount, o.o_orderstatus, p.p_type
