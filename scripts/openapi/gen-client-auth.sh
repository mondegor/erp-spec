
mrcmd_func_openapi_gen_client_auth() {
  mrcore_import "${MRCMD_CURRENT_PLUGINS_DIR}/${MRCMD_CURRENT_PLUGIN_NAME}/lib/gen-service.sh"

  local commonSrc="${1:?}"
  local serviceSrc="${2:?}"
  local destFilePath="${3:?}"

  cat "${OPENAPI_SPEC_DIR}/common/head.yaml" > "${destFilePath}"

  echo -e "\nservers:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/servers.yaml" "${destFilePath}" 2

  echo -e "\ntags:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/tags.yaml" "${destFilePath}" 2
  echo "" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Change/tags.yaml" "${destFilePath}" 2
  echo "" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Operations/tags.yaml" "${destFilePath}" 2
  echo "" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Validate/tags.yaml" "${destFilePath}" 2

  echo -e "\n\npaths:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/paths.yaml" "${destFilePath}" 2
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Change/paths.yaml" "${destFilePath}" 2
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Operations/paths.yaml" "${destFilePath}" 2
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Validate/paths.yaml" "${destFilePath}" 2

  echo -e "\n\ncomponents:" >> "${destFilePath}"
  echo -e "\n\n  headers:" >> "${destFilePath}"
  #openapi_lib_add_string_to_end_file "${commonSrc}/components-headers.yaml" "${destFilePath}" 4
  #echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-headers.yaml" "${destFilePath}" 4

  echo -e "\n\n  parameters:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Change/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Operations/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Operations/components-parameters-operationToken.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Validate/components-parameters.yaml" "${destFilePath}" 4

  echo -e "\n\n  schemas:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-schemas-Account.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-schemas-CreateAccount.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-schemas-AuthAccount.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-schemas-AccessAccount.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Change/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Change/components-schemas-ChangeProtectedField.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Operations/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Validate/components-schemas.yaml" "${destFilePath}" 4

  echo -e "\n\n  responses:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Auth/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Change/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Operations/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/Validate/components-responses.yaml" "${destFilePath}" 4

  echo -e "\n\n  securitySchemes:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/securitySchemes.yaml" "${destFilePath}" 4

  openapi_lib_remove_spaces "${destFilePath}"

  mrcore_echo_ok "File ${destFilePath} generated"
}
