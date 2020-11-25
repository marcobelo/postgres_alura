run_course_1_db:
	docker-compose -f course_1/docker-compose.yml up

run_course_2_db:
	docker-compose -f course_2/docker-compose.yml up
	
down_course_2_db:
	docker-compose -f course_2/docker-compose.yml down -v