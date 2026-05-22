# OHIF Viewer Test Data Set

The [viewer-testdata](https://github.com/OHIF/viewer-testdata) repository provides version-controlled DICOM studies used to test [OHIF Viewer](https://github.com/OHIF/Viewers) and related DICOMweb integrations. Source files live under `dcm/`; static DICOMweb output is generated with `mkdicomweb` into `dicomweb/`.

Study metadata below was read from one representative `.dcm` file per directory (tags `(0010,0010)`, `(0010,0020)`, `(0020,000D)` via `dcmdump -w 192`). All instances within a directory share the same patient and study identifiers.


## Studies in `dcm/`

| Directory | Patient Name | Patient ID | Study Instance UID |
|-----------|--------------|------------|-------------------|
| `acrin/` | ACRIN-NSCLC-FDG-PET-042 | ACRIN-NSCLC-FDG-PET-042 | `1.3.6.1.4.1.14519.5.2.1.7009.2403.334240657131972136850343327463` |
| `Dummy/` | Dummy | 716713622818558421526494572171041020891020924597 | `1.2.826.0.13854362241694438965858641723883466450351448` |
| `FreeSurferSeg/` | f4aa242907c17eab660a3547a0ae78c3 | 92afb4624d113e39451e07fbfb0a0892 | `1.3.12.2.1107.5.2.32.35162.30000015050317233592200000046` |
| `image-types/` | Anonymized | 0000004 | `2.16.840.1.113662.2.1.1519.11582.1990505.1105152` |
| `Juno/` | Juno | 0000003 | `1.3.6.1.4.1.25403.345050719074.3824.20170125113417.1` |
| `MisterMr/` | MISTER^MR | 832040 | `1.2.840.113619.2.5.1762583153.215519.978957063.78` |
| `mixedVideo/` | Horse | 123 | `2.25.96975534054447904995905761963464388233` |
| `overlay/` | Test^Röntgen | 20210922-01-0001 | `1.3.46.670589.30.1.3.1.1625260923.1632320482484.1` |
| `scoord3d-and-scoord/` | 149872^LSS | 101287 | `1.2.840.113654.2.55.242841386983064378162007136685545369722` |
| `sm/` | -^- | WE12_7354 | `1.2.276.1.74.1.2.132733202464108492637644434464108492` |
| `tg18/luminance-1K/` | AAPM^Test^Patterns | TG18-2002 | `2.16.124.113543.6004.101.103.20021117.162333.1` |
| `tg18/multi-1K/` | AAPM^Test^Patterns | TG18-2002 | `2.16.124.113543.6004.101.103.20021117.190619.1` |
| `tg18/noise-1k/` | AAPM^Test^Patterns | TG18-2002 | `2.16.124.113543.6004.101.103.20021117.123455.1` |
| `tg18/resolution-2k/` | AAPM^Test^Patterns | TG18-2002 | `2.16.124.113543.6004.101.103.20021117.061159.1` |
| `anonymous_ecg.dcm` | Anonymous | 642341 | `1.3.76.13.65829.2.20130125082826.1072139.2` |
| `roadmap.dcm` | *(empty)* | *(empty)* | `2.25.317377619501274872606137091638706705333` |


## Licensing

Each study is redistributed under the license of its original source. Where a license is shown below, contributors and downstream users should comply with its terms (attribution, share-alike, non-commercial, etc.). Where a license is marked **not specified**, the data appears to have been distributed for testing/research use but no formal license was attached at the original source — verify terms with the original provider before redistribution or commercial use.

**Studies sourced from NIH NCI TCIA / IDC**: most TCIA collections are released under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/) or [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Always check the specific collection page on TCIA for its license before redistribution.

**Do not add NSCLC-Radiomics data to this repository.** The [NSCLC-Radiomics collection on TCIA](https://www.cancerimagingarchive.net/collection/nsclc-radiomics/) is released under a license that does **not** permit commercial use, which makes it unsuitable for inclusion in test data that may be consumed by commercial OHIF integrators. Contributors evaluating new TCIA-sourced studies should confirm the collection's license allows commercial use before opening a PR.


## Citations

Only studies present in this repository are listed. Citations retained from the prior OHIF demo data list apply where the Study Instance UID matches; additional sources are noted for other local test data.


### NIH NCI TCIA — platform

- Clark, K., Vendt, B., Smith, K., Freymann, J., Kirby, J., Koppel, P., Moore, S., Phillips, S., Maffitt, D., Pringle, M., Tarbox, L., & Prior, F. (2013). The Cancer Imaging Archive (TCIA): Maintaining and Operating a Public Information Repository. *Journal of Digital Imaging*, 26(6), 1045–1057. https://doi.org/10.1007/s10278-013-9622-7


### `1.3.6.1.4.1.14519.5.2.1.7009.2403.334240657131972136850343327463` — ACRIN-NSCLC-FDG-PET (`acrin/`)

ACRIN 6668 Trial NSCLC-FDG-PET (ACRIN 6668)

- Kinahan, P., Muzi, M., Bialecki, B., Herman, B., & Coombs, L. (2019). Data from the ACRIN 6668 Trial NSCLC-FDG-PET (Version 2) [Data set]. The Cancer Imaging Archive. https://doi.org/10.7937/tcia.2019.30ilqfcl
- Machtay, M., Duan, F., Siegel, B. A., Snyder, B. S., Gorelick, J. J., Reddin, J. S., Munden, R., Johnson, D. W., Wilf, L. H., DeNittis, A., Sherwin, N., Cho, K. H., Kim, S., Videtic, G., Neumann, D. R., Komaki, R., Macapinlac, H., Bradley, J. D., & Alavi, A. (2013). Prediction of Survival by [18F]Fluorodeoxyglucose Positron Emission Tomography in Patients With Locally Advanced Non–Small-Cell Lung Cancer Undergoing Definitive Chemoradiation Therapy: Results of the ACRIN 6668/RTOG 0235 Trial. *Journal of Clinical Oncology*, 31(30), 3823–3830. https://doi.org/10.1200/jco.2012.47.5947

Collection: https://wiki.cancerimagingarchive.net/pages/viewpage.action?pageId=39879162

**License**: [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/) (per TCIA collection page — commercial use permitted with attribution). Verify on the collection page above before redistribution.


### TG-18 display test patterns (`tg18/`)

Four studies in this repository (luminance 1K, multi-purpose 1K, noise 1K, resolution 2K) are from the AAPM Task Group 18 (TG-18) medical display assessment patterns. Files were obtained from the TG-18 distribution hosted by Duke RAI Labs (historical mirror noted in `dcm/tg18/README.txt`).

**Platform / source**

- RAI Labs — TG-18 resources: https://rai.labs.duke.edu/resources/tg-18-assessment-of-display-performance-for-medical-imaging-systems/
- AAPM TG-18 report (PDF): https://www.aapm.org/pubs/reports/or_03.pdf

**Report citation**

- Samei, E., Badano, A., Chakraborty, D., Compton, K., Cornelius, C., Corrigan, K., Flynn, M. J., Hemminger, B., Hangiandreou, N., Johnson, J., Moxley, M., Pavlicek, W., Roehrig, H., Rutz, L., Shepard, J., Uzenoff, R., Wang, J., & Willis, C. (2005). *Assessment of Display Performance for Medical Imaging Systems*, Report of the American Association of Physicists in Medicine (AAPM) Task Group 18. Medical Physics Publishing, Madison, WI. AAPM On-Line Report No. 03.

**Executive summary**

- Samei, E., Badano, A., Chakraborty, D., Compton, K., Cornelius, C., Corrigan, K., Flynn, M. J., Hemminger, B., Hangiandreou, N., Johnson, J., Moxley-Stevens, D. M., Pavlicek, W., Roehrig, H., Rutz, L., Shepard, J., Uzenoff, R. A., Wang, J., & Willis, C. E. (2005). Assessment of display performance for medical imaging systems: Executive summary of AAPM TG18 report. *Medical Physics*, 32(4), 1205–1225. https://doi.org/10.1118/1.1861159

**License**: Not specified. The TG-18 patterns are distributed by AAPM/Duke RAI Labs for medical display quality assessment; no explicit open-source license accompanies the dataset. The AAPM report itself is © AAPM. Use for testing display performance is the documented intent — verify with AAPM before redistribution outside that scope.

| Study Instance UID | `dcm/` subdirectory |
|--------------------|---------------------|
| `2.16.124.113543.6004.101.103.20021117.162333.1` | `tg18/luminance-1K/` |
| `2.16.124.113543.6004.101.103.20021117.190619.1` | `tg18/multi-1K/` |
| `2.16.124.113543.6004.101.103.20021117.123455.1` | `tg18/noise-1k/` |
| `2.16.124.113543.6004.101.103.20021117.061159.1` | `tg18/resolution-2k/` |


### `2.25.96975534054447904995905761963464388233` — Horse (`mixedVideo/`)

Anonymized colour images of a horse eye and a video in a single series (patient name “Horse”). The data are anonymized and distribution for testing [OHIF Viewer](https://github.com/OHIF/Viewers) is agreed with the provider.

- Data provided by **Freie Universität Berlin**. https://www.fu-berlin.de/

**License**: Custom permission. Distribution is granted by the provider specifically for testing OHIF Viewer — no general open-source license. Do not redistribute outside the OHIF testing context without re-confirming permission with FU Berlin.


### `1.3.76.13.65829.2.20130125082826.1072139.2` — Anonymous ECG (`anonymous_ecg.dcm`)

Public anonymized 12-lead DICOM ECG waveform sample (patient name “Anonymous”, SOP Class 12-lead ECG Waveform). The instance encodes rhythm waveform data per DICOM Supplement 30 and is intended for interoperability testing of ECG display and waveform handling.

- Sample provided by **David A. Clunie** (PixelMed Publishing) as a de-identified reference object for DICOM ECG / SCP-ECG tooling.
- David Clunie's Medical Image Format Site: https://www.dclunie.com/
- PixelMed Publishing: https://www.pixelmed.com/
- Clunie, D. A. (2004). *Extension of an Open Source DICOM Toolkit to Support SCP-ECG Waveforms* (2nd OpenECG Workshop, Berlin). https://www.dclunie.com/papers/OpenECGWshop_PixelMed.pdf

The same file is widely used as `anonymous_ecg.dcm` in open-source ECG viewers (for example [dicom-ecg-plot](https://github.com/marcodebe/dicom-ecg-plot)).

**License**: Not specified. The file is distributed by PixelMed/D. Clunie as a de-identified reference object and has been redistributed by multiple open-source ECG projects without restriction noted. No formal license accompanies the file — verify with PixelMed before commercial redistribution.


### Other studies (sources in repository)

| Study Instance UID | Directory | Source / notes | License |
|--------------------|-----------|----------------|---------|
| `1.2.826.0.13854362241694438965858641723883466450351448` | `Dummy/` | Synthetic test study (patient name “Dummy”); retrieved via DCM4CHEE for local testing (`dcm/README.md`). | Synthetic — no patient data; treated as freely redistributable. |
| `1.3.12.2.1107.5.2.32.35162.30000015050317233592200000046` | `FreeSurferSeg/` | Anonymized MR with segmentation objects for viewer testing. | Not specified — verify with original source before redistribution. |
| `2.16.840.1.113662.2.1.1519.11582.1990505.1105152` | `image-types/` | Medical image samples (multiple transfer syntaxes / bit depths). https://barre.dev/medical/samples/ (see also DCMTK wiki: https://support.dcmtk.org/redmine/projects/dcmtk/wiki/DICOM_images) | Not specified — samples published by Sébastien Barré for testing; no formal license noted. |
| `1.3.6.1.4.1.25403.345050719074.3824.20170125113417.1` | `Juno/` | Color photograph DICOM samples with NIfTI segmentations for overlay/segmentation testing. | Not specified — verify with original source before redistribution. |
| `1.2.840.113619.2.5.1762583153.215519.978957063.78` | `MisterMr/` | Structured report and presentation state examples. | Not specified — verify with original source before redistribution. |
| `2.25.96975534054447904995905761963464388233` | `mixedVideo/` | Horse eye images and video — see citation above. | Custom permission from FU Berlin — see citation above. |
| `1.3.46.670589.30.1.3.1.1625260923.1632320482484.1` | `overlay/` | Test data with compressed overlays (JPEG-LS). | Not specified — verify with original source before redistribution. |
| `1.2.840.113654.2.55.242841386983064378162007136685545369722` | `scoord3d-and-scoord/` | Spatial coordinates (SCOORD / SCOORD3D) annotation examples. | Not specified — verify with original source before redistribution. |
| `1.2.276.1.74.1.2.132733202464108492637644434464108492` | `sm/` | Anonymized whole slide microscopy (SM) for OHIF viewer testing (`dcm/sm/README.txt`). | Not specified — verify with original source before redistribution. |
| `1.3.76.13.65829.2.20130125082826.1072139.2` | `anonymous_ecg.dcm` | Anonymized 12-lead ECG waveform — see citation above. | Not specified (PixelMed/Clunie reference object) — see citation above. |
| `2.25.317377619501274872606137091638706705333` | `roadmap.dcm` | XA roadmap / multi-frame test object. | Not specified — verify with original source before redistribution. |
