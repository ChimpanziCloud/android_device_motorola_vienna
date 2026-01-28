# For Minimal Manifest
export ALLOW_MISSING_DEPENDENCIES=true

# IDK what this is for
export LC_ALL="C"

# Build Device Codename
export FOX_BUILD_DEVICE=vienna

# Device uses virtual ab ota update
export FOX_VIRTUAL_AB_DEVICE=1

# LZMA Compression for Size Reduction
export OF_USE_LZMA_COMPRESSION=1

# Optional
export FOX_BASH_TO_SYSTEM_BIN=1

# Device specific
export OF_SCREEN_H=2400

# Round corners
export OF_STATUS_INDENT_LEFT=52
export OF_STATUS_INDENT_RIGHT=48

# Skip /data, internal storage decryption
export OF_SKIP_FBE_DECRYPTION=0

# Optional
export OF_FORCE_CASEFOLDING=1

# Drastic Size Reduction
export FOX_DRASTIC_SIZE_REDUCTION=1
