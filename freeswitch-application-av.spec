Name:		freeswitch-application-av
Version:        1.10.3.release.5	
Release:	1.el7
Summary:        FreeSWITCH mod_av.so

Group:		Productivity/Telephony/Servers
License:	MPL1.1
URL:		http://www.freeswitch.org/
Source0:        %{name}-%{version}.tar.gz	

BuildRequires:	ffmpeg-devel, freeswitch-devel = %{version}
Requires:	ffmpeg-libs, freeswitch = %{version}

%description
FreeSWITCH mod_av.so packaging


%prep
%setup -q


%build
make all


%install
%make_install


%files
/usr/lib64/freeswitch/mod/mod_av.so

%doc

%changelog
* Thu Jun 11 2020 - shihping.chan@gmail.com
- packaging for 1.10.3 for CentOS 7

