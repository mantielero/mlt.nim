# nim c -r ex01
import mlt

echo "Version"
echo "int: ", mlt_version_get_int()
echo "major: ", mlt_version_get_major()
echo "minor: ", mlt_version_get_minor()
echo "revision: ", mlt_version_get_revision()
echo "string: ", mlt_version_get_string()