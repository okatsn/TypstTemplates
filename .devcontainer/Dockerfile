FROM okatsn/my-jupyter-with-julia:v2025c

USER root

# Install basic utilities
RUN apt-get update && apt-get install -y \
    # PDF utilities
    ghostscript \
    # KEYNOTE: the pdf combined by ghostscript can be exported to WORD of more stable results, comparing to the results of pdftk and qpdf.
    # Clean
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


USER $NB_USER