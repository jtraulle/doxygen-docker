FROM "alpine:3.10"

WORKDIR /home

RUN apk --update --no-cache add  \
        doxygen \
        # Used to generate diagrams
        # We do not forget to include the font (otherwise generated graphs will have squares instead of letters)
        graphviz font-bitstream-type1 \
        # Used to build the PDF using the Makefile generated by Doxygen
        make \
        # Used to convert graphs and images inserted into the PDF
        ghostscript

RUN apk add --no-cache \
            # We use the edge repository for texlive because the symlink to lualatex is missing in the 3.10 branch repo
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
            # Main TeX distribution
            texmf-dist \
            texmf-dist-latexextra \
            texmf-dist-langgreek \
            texlive \
            texlive-luatex
