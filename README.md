# DICOMWeb Server w/ Test Data

> ⚠️ THIS REPOSITORY IS NOT FOR PRODUCTION USAGE. It's a very simple way to provide tightly controlled test data to applications that integrate with DICOMWeb.

This repository is used as a version controlled collection of DICOM studies that are made available with lightweight implementation of [DICOMWeb][dicom-web]. We're leveraging the following projects:

- [dicomweb-server][dicomweb-server]: Lightweight DICOMweb Server with CouchDB
- [CouchDB][couchdb]: NoSQL document-oriented database solution
- [dicomweb-client][dicomweb-client]: Python client for DICOMweb services.

## Requirements

**For Running Container:**

- Docker: [Windows][win-docker] | [Mac][mac-docker]
- [Share your drive w/ docker][share-drive] (on mac your drive will be shared by default)

**For Uploading New Studies:**

- [Windows Subsystem for Linux][install-linux] (or Linux)
  - This is not strictly true, but I find it easier
- Install Python 3 & pip (Linux)
  - `apt-get -y install python3 python3-pip`
- Install Python 3 & pip (Mac)
  - `brew install python3 python3-pip`
- Install Dicomweb-client and pydicom (Linux/Mac)
  - `pip3 install dicomweb-client pydicom`

## Usage

**Start:**

- `docker-compose build`
- `docker-compose up`

**Add Studies:**

- `cd dcm`
- `python3 seed-db.py`

**Request Data:** ([QIDO-RS][qido-rs])

- Studies:
  - `http://localhost:5985/studies`
- Series in Study:
  - `http://localhost:5985/studies/<studyInstanceUid>/series`
- Instances in Series:
  - `http://localhost:5985/studies/<studyInstanceUid>/series/<seriesInstanceUid>/instances`

Where UIDs often have a format similar to: `1.2.276.0.74.3.1167540280.200511.112514.1`

**OHIF Server Config:**

By default `dicomweb-server` has a wide open CORS policy set in it's `fastify` config. This allows for little additional configuration.

```js
window.config = {
  routerBasename: "/",
  extensions: [],
  showStudyList: true,
  servers: {
    dicomWeb: [
      {
        name: "dicomweb_server",
        wadoUriRoot: "http://localhost:5985",
        qidoRoot: "http://localhost:5985",
        wadoRoot: "http://localhost:5985",
        qidoSupportsIncludeField: true,
        imageRendering: "wadouri",
        thumbnailRendering: "wadors",
        enableStudyLazyLoad: true
      }
    ]
  }
};
```

## Developing

- `config/` contains files used by docker images or projects.
- `couchdb-data/` is our volume mount point so we can persist our data
  - If you wanted multiple data sets, you could submodule this or choose a different mount point.
- `dcm/` contains our seed DICOM files. By default, the `seed-db.py` file will upload all `.dcm` files in this directory.

> :wave: If `couchdb-data` grows too large; we can simply re-upload `dcm` files when the volume is spun up.

### Resources

- [Python DICOMWeb Client Docs][dicomweb-client-docs]

<!--
    LINKS
-->

[dicomweb-server]: https://github.com/dcmjs-org/dicomweb-server
[dicom-web]: https://www.dicomstandard.org/dicomweb/
[couchdb]: https://couchdb.apache.org/
[dicomweb-client]: https://github.com/clindatsci/dicomweb-client
[qido-rs]: https://www.dicomstandard.org/dicomweb/query-qido-rs/
[win-docker]: https://docs.docker.com/docker-for-windows/install/
[mac-docker]: https://docs.docker.com/docker-for-mac/install/
[share-drive]: https://github.com/docker/for-win/issues/3174#issuecomment-477417558
[install-linux]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[dicomweb-client-docs]: https://dicomweb-client.readthedocs.io/en/latest/
