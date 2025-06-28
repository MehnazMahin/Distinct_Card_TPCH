SELECT
	l.l_linenumber, l.l_quantity, o.o_orderpriority, COUNT(*) as group_count
FROM
	LineItem l, Orders o
WHERE
	l.l_orderkey = o.o_orderkey
	AND l.l_quantity % 5 = 0
	AND l.l_returnflag = 'R'
	AND round(o.o_totalprice) % 100 < 10
	AND o.o_orderstatus = 'F'
GROUP BY
	l.l_linenumber, l.l_quantity, o.o_orderpriority
