let $sorted_courses :=
	for $c in enrollment/course
	order by number($c/@total) descending
	return $c
for $c in subsequence($sorted_courses, 1, 10)
let $total := data($c/@total)
let $cat_num := data($c/@cat_num)
let $newline := '&#xa;'
let $title := doc('courses.xml')/courses/course[@cat_num=$cat_num]/title
return concat(	$newline, $title, 
				$newline, "	catalog number:", $cat_num, 
				$newline, "	total enrollment:", $total)
