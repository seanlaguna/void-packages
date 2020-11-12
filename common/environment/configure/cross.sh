if [ -n "$CROSS_BUILD" ]; then # && [ "$XBPS_COMPILER" != "clang" ]; then
	if [ "$XBPS_COMPILER" = "clang" ]; then
		#LDFLAGS+=" -L/usr/lib32"
		LDFLAGS+="-L${XBPS_CROSS_BASE}/usr/lib"
		CFLAGS+="--target=${XBPS_CROSS_TRIPLET} --sysroot=/usr/${XBPS_CROSS_TRIPLET}"
		# Clang cannot find c++config.h by itself
		CXXFLAGS+="--target=${XBPS_CROSS_TRIPLET} --sysroot=/usr/${XBPS_CROSS_TRIPLET} \
			-I/usr/${XBPS_CROSS_TRIPLET}/include/c++/9.3.0/${XBPS_CROSS_TRIPLET}"
	else
		CFLAGS+=" -I${XBPS_CROSS_BASE}/usr/include"
		CXXFLAGS+=" -I${XBPS_CROSS_BASE}/usr/include"
		LDFLAGS+=" -L${XBPS_CROSS_BASE}/usr/lib"
	fi
fi
