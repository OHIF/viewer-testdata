Downloaded from our DCM4CHE using links like:

https://server.dcmjs.org/dcm4chee-arc/aets/DCM4CHEE/rs/studies/1.2.840.113619.2.5.1762583153.215519.978957063.78?accept=application/zip

Links download file with missing `.zip` extension.
Individual files in zip are missing `.dcm` extension.

Can use this to rename files:
- `find . -name "*" -exec bash -c 'mv "$1" "${1%}".dcm' - '{}' \;`


And this to flatten directories:
- `find ./Dummy -mindepth 3 -type f -exec mv -i '{}' ./Dummy ';'`
