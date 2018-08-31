Name:		myrand
Version:	
Release:	1%{?dist}
Summary:	

Group:		
License:	UnLicense
URL:		https://github.com/LouLeBlanc/myrand
Source0:	

BuildRequires:	gcc
Requires:	

%description
The myrand utility is a small program written in C that generates random numbers on the command line.  By default, a single random integer is generated, but if an integer is passed in, myrand will generate the specified number of random integers.


%prep
%setup -q


%build
%configure
make %{?_smp_mflags}


%install
%make_install


%files
%doc



%changelog

