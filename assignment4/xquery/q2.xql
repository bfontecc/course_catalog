for $c in
	courses/course[
		schedule/meeting/@day="1"
		and meeting_locations/location/@building="Science Center"
		and meeting_locations/location/@room=" A"]
let $newline := '&#xa;'
let $title := $c/title
let $times := ""
for $meeting in $c/schedule/meeting[@day=1]
	let $begin := $meeting/@begin_time
	let $end := $meeting/@end_time
	let $times := concat($times, $newline, "	", $begin, " - ", $end)
return concat($newline, $title, $times)
