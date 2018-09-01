# Written by Louis LeBlanc
# For Homework Assignment 5
# Release Control and Continuous Integration/Continuous Delivery
# Brandeis University,
# Instructed by Eric Hemdal
#
# References:
# RPM Packaging guide:
#    https://rpm-guide.readthedocs.io/en/latest/rpm-guide.html
# Fedora Packager's Guide:
#    https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/Packagers_Guide/index.html
#

# Keep it simple
%define		_source_dir %{_topdir}/SOURCES

Name:		myrand
Version:	0.1
Release:	1%{?dist}
Summary:	Basic random number generator for the command line

Group:		Brandeis
License:	UnLicense
URL:		https://github.com/LouLeBlanc/myrand
Source0:	%{name}.tar.gz

BuildRequires:	gcc
BuildRequires:	tar

%description
The myrand utility is a small program written in C that generates random numbers on the command line.  By default, a single random integer is generated, but if an integer is passed in, myrand will generate the specified number of random integers.

%prep
tar zxf %{_source_dir}/%{SOURCEURL0} -C %{_builddir}

%build
cd %{_builddir}
make 

%install
rm -rf %{buildroot}/usr

mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/share/doc/myrand
install -m 0755 %{_builddir}/bin/%{name} %{buildroot}/usr/bin/%{name}
install -m 0644 %{_builddir}/README.md %{buildroot}/usr/share/doc/myrand/README.md

%clean
rm -rf %{_builddir}
rm -rf %{buildroot}
rm -f %{_source_dir}/%{SOURCEURL0}


%files
%doc README.md
%{_bindir}/myrand


%changelog
* Sat Sep 1 2018 Louis LeBlanc <lleblanc@brandeis.edu> - 0.1.1
- First myrand package

