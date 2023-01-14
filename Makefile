all: dependencies build install rpm

build:
	go build -o prometheus_varnish_exporter .

clean:
	rm -f prometheus_varnish_exporter

dependencies:
	go get -u github.com/golang/dep/cmd/dep
	dep ensure
	curl -LJO https://github.com/jonnenauha/prometheus_varnish_exporter/archive/refs/heads/master.zip
	unzip master.zip
	mv prometheus_varnish_exporter-*/* .
	rm -rf prometheus_varnish_exporter-*
	rm -f master.zip

install: build
	@echo "******************************************************************"
	@echo "*  WARNING: This command requires root privileges to run.         *"
	@echo "*  Please run 'sudo make install' or run the command below as root *"
	@echo "*  install -m 0755 prometheus_varnish_exporter /usr/local/bin/   *"
	@echo "******************************************************************"

rpm:
	rpmbuild -ba prometheus-varnish-exporter.spec
