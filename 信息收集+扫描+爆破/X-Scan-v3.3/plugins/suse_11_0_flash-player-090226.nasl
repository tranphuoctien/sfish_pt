
#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(39962);
 script_version("$Revision: 1.4 $");
 script_name(english: "SuSE 11.0 Security Update:  flash-player (2009-02-26)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing a security patch for flash-player");
 script_set_attribute(attribute: "description", value: "Specially crafted swf files could cause a buffer overflow
in flash-player. Attackers could potentially exploit that
to execute code on the victim's machine (CVE-2009-0519,
CVE-2009-0520, CVE-2009-0114, CVE-2009-0521).
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Run yast to install the security patch for flash-player");
script_set_attribute(attribute: "see_also", value: "https://bugzilla.novell.com/show_bug.cgi?id=476907");
script_end_attributes();

 script_cve_id("CVE-2009-0114", "CVE-2009-0519", "CVE-2009-0520", "CVE-2009-0521");
script_summary(english: "Check for the flash-player package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"flash-player-9.0.159.0-0.1", release:"SUSE11.0", cpu:"i586") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
exit(0,"Host is not affected");
