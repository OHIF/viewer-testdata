colorEncode
===========

One standard colour test image, encoded into every lossless transfer syntax
DICOM defines for 8-bit RGB. All twelve instances decode to **bit-identical
pixels**, so a decoder that gets any one of them wrong shows up as a difference
against the other eleven — and against the reference dump in `reference/`.

Regenerate with [`../encode-samples.py`](../encode-samples.py).

Attribution and data status
---------------------------

The image is **`kodim23` (parrots) from the Kodak True Color image suite**,
<https://r0k.us/graphics/kodak/kodak/kodim23.png>, released by Eastman Kodak for
unrestricted use. It is the de-facto corpus for comparing lossless colour
codecs.

**This is not medical data and not of any patient.** It is a photographic test
image wrapped in a synthetic Secondary Capture header — there is no human
subject to de-identify. Each file records this in its own header: `(0012,0062)
PatientIdentityRemoved` is `YES`, `(0012,0063) DeidentificationMethod` says
"Not patient data; no human subject to de-identify", and `(0008,2111)
DerivationDescription` carries the attribution — so a file that gets separated
from this README still says where it came from.

**For codec testing only. Not for clinical use.**

The image
---------

768×512, 8-bit, interleaved RGB (`PlanarConfiguration` 0), stored as Secondary
Capture. `kodim23` was picked from the suite for its smooth gradients over
saturated primaries, which is where a wrong colour transform or a mislabelled
Photometric Interpretation shows up first.

The files
---------

| File | Transfer Syntax | Photometric | Encoder |
|---|---|---|---|
| `implicit-le.dcm` | `1.2.840.10008.1.2` — Implicit VR Little Endian | RGB | pydicom |
| `explicit-le.dcm` | `1.2.840.10008.1.2.1` — Explicit VR Little Endian | RGB | pydicom |
| `explicit-be.dcm` | `1.2.840.10008.1.2.2` — Explicit VR Big Endian (retired) | RGB | pydicom |
| `encapsulated-uncompressed.dcm` | `1.2.840.10008.1.2.1.98` — Encapsulated Uncompressed | RGB | pydicom |
| `rle-lossless.dcm` | `1.2.840.10008.1.2.5` — RLE Lossless | RGB | pydicom |
| `jpeg-lossless-p14.dcm` | `1.2.840.10008.1.2.4.57` — JPEG Lossless, Process 14 | RGB | dcm4che |
| `jpeg-lossless-sv1.dcm` | `1.2.840.10008.1.2.4.70` — JPEG Lossless, Process 14 SV1 | RGB | dcm4che |
| `jpeg-ls-lossless.dcm` | `1.2.840.10008.1.2.4.80` — JPEG-LS Lossless | RGB | CharLS |
| `jpeg2000-lossless.dcm` | `1.2.840.10008.1.2.4.90` — JPEG 2000 Lossless | **YBR_RCT** | OpenJPEG |
| `htj2k-lossless.dcm` | `1.2.840.10008.1.2.4.201` — HTJ2K Lossless | **YBR_RCT** | OpenJPH |
| `htj2k-lossless-rpcl.dcm` | `1.2.840.10008.1.2.4.202` — HTJ2K Lossless RPCL | **YBR_RCT** | OpenJPH |
| `jpeg-xl-lossless.dcm` | `1.2.840.10008.1.2.4.110` — JPEG XL Lossless | RGB | libjxl |

The three JPEG 2000 family files apply the reversible colour transform, so their
Photometric Interpretation is `YBR_RCT` and the codec undoes the transform on
decode. The other nine carry `RGB`. Getting this pairing wrong is the classic
way to end up with a blue-and-orange parrot, which is exactly what this corpus
is for.

As in [`../grayEncode`](../grayEncode), `.57` and `.70` differ in codestream
predictor (selection value 6 versus the 1 that `.70` requires), and `.202`
carries the RPCL progression, TLM markers, and decomposition count that
transfer syntax mandates.

The filenames match `../grayEncode` exactly, so the same tooling can walk both.

Identity
--------

All twelve instances are **one study in one series**, because they are all the
same picture:

| | |
|---|---|
| Patient Name | `color^encode^^^` |
| Patient ID | `colorEncode` |
| Study Instance UID | `2.25.209862227405752705869509247293216117237` |
| Study ID / Description | `colorEncode` |
| Accession Number | `COLORENCODE` |
| Series Description | `Kodak 23, parrots` |
| Instance Number | 1–12, in the table order above |

Patient identity is a property of the study and Series Description a property of
the series, so neither varies. **The encoding is named per instance**, in
`(0020,4000) ImageComments` (`1.2.840.10008.1.2.4.110 - JPEG XL Lossless`) and
in `(0008,2111) DerivationDescription`. Most viewers show one or the other.

A second source image would go in a second series, keeping this one intact —
that is the rule the generator follows: a new series only for a new picture, and
the same picture in twelve encodings stays in one series.

reference/
----------

- `kodim23-768x512-rgb8.raw` — 1 179 648 bytes, uint8 interleaved RGB,
  row-major. What every file here must decode to.
  SHA-256 `81992a83592267e69125666f3e3e04c1819529b4c4c1e55fde0a6a741bac4219`
- `kodim23.png` — the original as downloaded, so the corpus can be rebuilt
  without network access.
- `manifest.json` — geometry, provenance, attribution, and per-instance transfer
  syntax, UIDs, photometric interpretation, encoded size, and which decoder
  verified it.

How this was verified
---------------------

The generator refuses to leave behind a file that does not round-trip, and every
file here was decoded back and compared with the reference:

- pydicom decodes eight of the twelve directly.
- `.201` and `.202` go through OpenJPEG — a different implementation from the
  OpenJPH that encoded them — and `.110` through libjxl.
- `.1.98` needs no codec; its fragment is compared byte for byte.
- Independently, dcm4che's `dcm2dcm` decoded eleven of the twelve back to
  Explicit VR Little Endian and agreed. It has no opinion on `.1.98`, which it
  passes through untouched.
