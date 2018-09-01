#RPM build instructions for myrand

---

Building an RPM from this git repo can be performed with the `rpmbuild` target.
Before building an RPM, be sure the RPM version information is updated on the following lines of the `myrand.spec` file:

```
Version:	0.1
Release:	1%{?dist}
```

Next, add a changelog to the top of the `%changelog` section:
```
%changelog
* Sat Sep 1 2018 Louis LeBlanc <lleblanc@brandeis.edu> - 0.1.1
- First myrand package
```
Add new entries just below the `%changelog` line with a blank line between entries.  The changelog should be in chronological order from newest to older entries.

Once this is correct, commit the changes and build the RPM with the following command:

```
make rpmbuild
```
This target will perform the following steps:
1. Create the source archive
2. Set up the RPM build tree in ~/rpmbuild
3. Copy the archive and RPM spec to the RPM build tree
4. Perform the RPM build
5. Copy the RPMS directory from ~/rpmbuild back to the project directory

When complete, there will be an RPMS directory tree with the RPM present as indicated by the output of the `tree` command:


<pre>
$ make rpmbuild
/sbin/ldconfig: Warning: ignoring configuration file that cannot be opened: /etc/ld.so.conf: No such file or directory
RPM build complete
<font color="#0087FF">RPMS</font>
└── <font color="#0087FF">x86_64</font>
    └── <font color="#FF0000">myrand-0.1-1.fc28.x86_64.rpm</font>

1 directory, 1 file
</pre>





