Name:           simple
Version:        1.0
Release:        0
License:        GPL
Summary:        Simple dummy package
Summary(es):    Paquete simple de muestra
Url:            http://www.dummmy.com
Group:          Development
BuildRoot:      %{_tmppath}/%{name}-%{version}-build

%description
Dummy package

%description -l es
Paquete de muestra

%prep

%build
mkdir -p %{buildroot}%{_datadir}/%{name}
echo "Hello" > %{buildroot}%{_datadir}/%{name}/README
echo "Hola" > %{buildroot}%{_datadir}/%{name}/README.es

%install

%clean
%{?buildroot:%__rm -rf "%{buildroot}"}

%post

%postun

%files
%defattr(-,root,root)
%{_datadir}/%{name}/README
%{_datadir}/%{name}/README.es

%changelog
