# Keep it simple
%define		_source_dir %{_topdir}/SOURCES

Name:		myrand
Version:	1.0
Release:	1%{?dist}
Summary:	Basic random number generator for the command line

Group:		Brandeis
License:	UnLicense
URL:		https://github.com/LouLeBlanc/myrand
Source0:	%{name}.tar.gz

# BuildRoot:	%{_topdir}/BUILDROOT/%{name}-%{version}-%{release}
BuildRequires:	gcc

%description
The myrand utility is a small program written in C that generates random numbers on the command line.  By default, a single random integer is generated, but if an integer is passed in, myrand will generate the specified number of random integers.

%prep
tar zxf %{_source_dir}/%{SOURCEURL0} -C %{_builddir}

%build
echo "Building"
cd %{_builddir}
make 

%install
rm -rf %{buildroot}/usr

mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/share/doc/myrand
echo "Installing"
install -m 0755 %{_builddir}/bin/%{name} %{buildroot}/usr/bin/%{name}
install -m 0644 %{_builddir}/README.md %{buildroot}/usr/share/doc/myrand/README.md
echo "Done Installing"

%clean
rm -rf %{_builddir}
rm -rf %{buildroot}


%files
%doc README.md
%{_bindir}/myrand


%changelog

