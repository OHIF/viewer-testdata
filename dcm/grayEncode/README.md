grayEncode
==========

One grayscale CT frame, encoded into every lossless transfer syntax DICOM
defines for it. All twelve instances decode to **bit-identical pixels**, so a
decoder that gets any one of them wrong shows up as a difference against the
other eleven — and against the reference dump in `reference/`.

Regenerate with [`../encode-samples.py`](../encode-samples.py).

Attribution and data status
---------------------------

The pixels come from **[`../image-types/CT-MONO2-16-brain.jls.dcm`](../image-types/CT-MONO2-16-brain.jls.dcm)**,
which is from the **Barré DICOM sample set**, <https://barre.dev/medical/samples/>,
published there for public use. Acquired on a Picker PQ5000 in 1999.

**This is anonymized sample data, not a real identifiable patient.** It was
already anonymized at source; this corpus additionally blanks the remaining
identifying attributes (institution, station, physician names, patient
demographics, device serial) and replaces every UID with a deterministic
`2.25.…` value. Each file records this in its own header — `(0012,0062)
PatientIdentityRemoved` is `YES`, `(0012,0063) DeidentificationMethod` lists
what was done, and `(0008,2111) DerivationDescription` carries the attribution —
so a file that gets separated from this README still says where it came from.

**Redistributed for codec testing only. Not for clinical use.**

The image
---------

512×512, 16-bit **signed**, MONOCHROME2, one axial slice of a brain. Pixel
values run −1057 … 1440 with Rescale Slope 1 / Intercept 0, so the stored values
are Hounsfield units directly.

`PixelRepresentation` is 1, which is the interesting part: three of these codecs
have no signed sample type, so the corpus exercises how each one is expected to
carry two's complement data.

The files
---------

| File | Transfer Syntax | Encoder |
|---|---|---|
| `implicit-le.dcm` | `1.2.840.10008.1.2` — Implicit VR Little Endian | pydicom |
| `explicit-le.dcm` | `1.2.840.10008.1.2.1` — Explicit VR Little Endian | pydicom |
| `explicit-be.dcm` | `1.2.840.10008.1.2.2` — Explicit VR Big Endian (retired) | pydicom |
| `encapsulated-uncompressed.dcm` | `1.2.840.10008.1.2.1.98` — Encapsulated Uncompressed | pydicom |
| `rle-lossless.dcm` | `1.2.840.10008.1.2.5` — RLE Lossless | pydicom |
| `jpeg-lossless-p14.dcm` | `1.2.840.10008.1.2.4.57` — JPEG Lossless, Process 14 | dcm4che |
| `jpeg-lossless-sv1.dcm` | `1.2.840.10008.1.2.4.70` — JPEG Lossless, Process 14 SV1 | dcm4che |
| `jpeg-ls-lossless.dcm` | `1.2.840.10008.1.2.4.80` — JPEG-LS Lossless | CharLS |
| `jpeg2000-lossless.dcm` | `1.2.840.10008.1.2.4.90` — JPEG 2000 Lossless | OpenJPEG |
| `htj2k-lossless.dcm` | `1.2.840.10008.1.2.4.201` — HTJ2K Lossless | OpenJPH |
| `htj2k-lossless-rpcl.dcm` | `1.2.840.10008.1.2.4.202` — HTJ2K Lossless RPCL | OpenJPH |
| `jpeg-xl-lossless.dcm` | `1.2.840.10008.1.2.4.110` — JPEG XL Lossless | libjxl |

The two JPEG lossless files differ in the predictor their codestream selects:
`.57` uses selection value 6, `.70` uses selection value 1, which that transfer
syntax requires. `.202` differs from `.201` by more than the UID — it carries
RPCL progression, TLM marker segments, and enough decompositions that the base
resolution is 16 across, all of which `.202` mandates and `.201` does not.

Identity
--------

All twelve instances are **one study in one series**, because they are all the
same picture:

| | |
|---|---|
| Patient Name | `gray^encode^^^` |
| Patient ID | `grayEncode` |
| Study Instance UID | `2.25.262478289063731792084544913479622212167` |
| Study ID / Description | `grayEncode` |
| Accession Number | `GRAYENCODE` |
| Series Description | `CT brain 512x512 16-bit signed, lossless transfer syntaxes` |
| Instance Number | 1–12, in the table order above |

Patient identity is a property of the study and Series Description a property of
the series, so neither varies. **The encoding is named per instance**, in
`(0020,4000) ImageComments` (`1.2.840.10008.1.2.4.110 - JPEG XL Lossless`) and
in `(0008,2111) DerivationDescription`. Most viewers show one or the other.

Because the series mixes twelve transfer syntaxes, scrolling through it in a
viewer is itself the test: every slice must look identical, and any flicker is a
codec bug.

reference/
----------

- `ct-brain-512x512-i16le.raw` — 524 288 bytes, int16 little-endian, row-major.
  What every file here must decode to.
  SHA-256 `dd3e7df2f189a9b947a3e808e57d810c98c5d08109b0107e85f2b5e65c8fefeb`
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

See also
--------

[`../colorEncode`](../colorEncode) — the same twelve syntaxes over an 8-bit RGB
image, where the colour transform is the thing being tested.
