# nim c -r ex01
import mlt

echo "Version"
echo "int: ", versionGetInt()
echo "major: ", versionGetMajor()
echo "minor: ", versionGetMinor()
echo "revision: ", versionGetRevision()
echo "string: ", versionGetString()
