import os
import pydicom
from dicomweb_client.api import DICOMwebClient

# Init Client
client = DICOMwebClient("http://localhost:5985")

# Walk current directory and subdirectories
for root, dirs, files in os.walk("."):
    for file in files:
        if file.endswith(".dcm"):
            # Found `.dcm` file
            print(os.path.join(root, file))
            # Store instance
            filename = os.path.join(root, file)
            dataset = pydicom.dcmread(filename)
            client.store_instances(datasets=[dataset])