kill_all:
	docker-compose -f course_1/docker-compose.yml kill
	docker-compose -f course_2/docker-compose.yml kill

c1_run:
	make kill_all
	docker-compose -f course_1/docker-compose.yml up

c2_run:
	make kill_all
	docker-compose -f course_2/docker-compose.yml up

c1_fresh_start:
	docker-compose -f course_1/docker-compose.yml down -v
	make c1_run
	
c2_fresh_start:
	docker-compose -f course_2/docker-compose.yml down -v
	make c2_run
