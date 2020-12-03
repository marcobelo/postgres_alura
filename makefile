kill_all:
	docker-compose -f course_1/docker-compose.yml kill
	docker-compose -f course_2/docker-compose.yml kill
	docker-compose -f course_3/docker-compose.yml kill
	docker-compose -f course_4/docker-compose.yml kill
	docker-compose -f course_5/docker-compose.yml kill

c1_run:
	make kill_all
	docker-compose -f course_1/docker-compose.yml up

c2_run:
	make kill_all
	docker-compose -f course_2/docker-compose.yml up

c3_run:
	make kill_all
	docker-compose -f course_3/docker-compose.yml up

c4_run:
	make kill_all
	docker-compose -f course_4/docker-compose.yml up

c5_run:
	make kill_all
	docker-compose -f course_5/docker-compose.yml up

c1_fresh_start:
	docker-compose -f course_1/docker-compose.yml down -v
	make c1_run
	
c2_fresh_start:
	docker-compose -f course_2/docker-compose.yml down -v
	make c2_run

c3_fresh_start:
	docker-compose -f course_3/docker-compose.yml down -v
	make c3_run

c4_fresh_start:
	docker-compose -f course_4/docker-compose.yml down -v
	make c4_run

c5_fresh_start:
	docker-compose -f course_5/docker-compose.yml down -v
	make c5_run