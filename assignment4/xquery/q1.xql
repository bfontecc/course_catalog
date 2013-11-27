for $l in
	distinct-values(courses/course/course_number/num_int)
let $count	:= count(courses/course[course_number/num_int=$l])
let $sep	:= ':	'
order by number($l)
return concat('&#xa;', $l, $sep, $count);
