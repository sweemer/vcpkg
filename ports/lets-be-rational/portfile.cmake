
vcpkg_download_distfile(ARCHIVE
    URLS "http://www.jaeckel.org/LetsBeRational.7z"
    FILENAME "LetsBeRational.7z"
    SHA512 0db0654df814f16271eb13d53b43bf0913cbcb48fcaa22e3cb8e3128c208888f6a1d76e681db9573bb4cc295e86a0d1b1927c53a9031db9f94ea58bb60069583
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

file(GLOB PUBLIC_HEADERS "${SOURCE_PATH}/*.h")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/include")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/LICENSE" DESTINATION "${SOURCE_PATH}")
file(COPY ${PUBLIC_HEADERS} DESTINATION "${CURRENT_PACKAGES_DIR}/include")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/vcpkg-cmake-wrapper.cmake" "${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg-cmake-wrapper.cmake" @ONLY)
