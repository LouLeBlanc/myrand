Name:           myrand
Version:        0.1
Release:        1%{?dist}
Summary:        A program that generates random numbers on the command line

License:        UnLicense
URL:            https://LouLeBlanc/myrand
Source0:        https://github.com/LouLeBlanc/myrand/archive/master.zip

BuildRequires:  gcc
BuildRequires:  unzip
BuildRequires:  wget
Requires:       linux-vdso.so.1
Requires:       /lib64/libm.so.6
Requires:       /lib64/libc.so.6
Requires:       ld-linux-x86-64.so.2

%description
The myrand utility is a small program written in C that generates random numbers on the command line.  By default, a single random integer is generated, but if an integer is passed in, myrand will generate the specified number of random integers.

%build
make myrand

%install
rm -rf $RPM_BUILD_ROOT
install -m 755 -d $RPM_BUILD_ROOT/%{_bindir}

%files
%license LICENSE
%doc README.md

%changelog
* Fri Aug 31 2018 Louis LeBlanc <lleblanc@brandeis.edu>
- 
