.PHONY:mongo testdata server app

mongo:
	docker run -d --name mongo -p 2717:27017 -v ~/mongodb:/data/db mvertes/alpine-mongo

testdata:
	./testdata.sh

server:
	cd server; npm install; npm run dev

app:
	cd app; npm install;NODE_OPTIONS=--openssl-legacy-provider npm run start