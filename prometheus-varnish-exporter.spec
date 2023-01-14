Name: prometheus-varnish-exporter
Version: 0.1
Release: 1
Summary: Prometheus exporter for Varnish Cache

Group: System Environment/Daemons
License: MIT
URL: https://github.com/varnish/prometheus_varnish_exporter

Source0: https://github.com/varnish/prometheus_varnish_exporter/releases/download/%{version}/prometheus_varnish_exporter-%{version}-%{release}.tar.gz

BuildRequires: golang

%description
Prometheus exporter for Varnish Cache

%prep
%setup -q

%build
make build

%install
mkdir -p %{buildroot}/usr/local/bin
install -m 0755 prometheus_varnish_exporter %{buildroot}/usr/local/bin/

%files
/usr/local/bin/prometheus_varnish_exporter

%changelog
* Tue Jan 14 2022 Marcus Bergo <eu@mbergo.dev> - 0.1-1
- Initial release
