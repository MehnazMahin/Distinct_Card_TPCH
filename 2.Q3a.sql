SELECT
	l.l_linenumber, l.l_returnflag, o.o_orderpriority, 
	COUNT(*) as group_count
FROM
	LineItem l, Orders o
WHERE
	l.l_orderkey = o.o_orderkey
	AND l.l_quantity > 30
	AND round(o.o_totalprice) % 100 = 0
GROUP BY
	l.l_linenumber, l.l_returnflag, o.o_orderpriority
