## PTCL Paper Figure Generation

This package contains the files required to reproduce all figures and supplementary figures for the PTCL manuscript.

### Included files

- **PTCLFiguresUploadFinal_Final2.Rmd**
  - Main R Markdown script used to generate every main and supplementary figure for the manuscript.
  - Figures are generated in the order they appear in the paper.

- **PTCLFiguresUploadFinal_Final2.RData**
  - R workspace containing all processed data objects required by the R Markdown script.
  - Loading this file avoids repeating the entire preprocessing pipeline.

- **listATLL.txt**
  - List of coverage files from ATLL patients for the HTLV-1 genome, normalized by GC content.

- **listCARRIERS.txt**
  - List of coverage files from HTLV-1 carriers without ATLL progression during at least 5 years for the HTLV-1 genome, normalized by GC content.

- **HTLV1_CNVanalysis.zip**
  - ZIP archive containing raw data for GC content–normalized HTLV-1 genome coverage files from ATLL patients and HTLV-1 carriers.

- **swoosh_function_PFS.R and plotHR_0.11.R**
  - Rscripts which define the fucntion to draw Figure S4F

### Requirements

The analysis was performed in R using the packages specified in the R Markdown file. Please ensure that all required packages are installed before running the script.

### How to reproduce the figures

1. Place the `PTCLFiguresUploadFinal_Final2.Rmd` , listATLL.txt, listCARRIERS.txt, swoosh_function_PFS.R, plotHR_0.11.R, and `PTCLFiguresUploadFinal_Final2.RData` files in the same directory.
2. Open `PTCLFiguresUploadFinal_Final2.Rmd` in RStudio (or another compatible R Markdown environment).
3. Extract the ZIP archive in the same directory so that all GC-corrected coverage files required for the HTLV-1 CNV analysis are available to the R Markdown script.
4. Load the accompanying `.RData` file if it is not loaded automatically.
5. Run the R Markdown document from beginning to end (or knit the document) to reproduce all figures.

### Notes

- The script generates all main figures and supplementary figures included in the manuscript.
- Intermediate objects are stored in the accompanying `.RData` file to facilitate reproducibility and reduce computation time.
- Figure numbering follows the manuscript organization.