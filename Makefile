build:
	git submodule init
	git submodule update
	docker build --rm -t davewongillies/vmail .

push:
	docker push davewongillies/vmail

all:
	build
