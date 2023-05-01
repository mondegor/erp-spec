
readonly OPENAPI_NAME="ERP API"

readonly OPENAPI_VARS=(
  "OPENAPI_SPEC_DIR"
  "OPENAPI_ASSEMBLY_DIR"
  "OPENAPI_SERVICE_FILE_POSTFIX"
  "OPENAPI_SERVICE_CLIENT_AUTH"
)

# default values of array: OPENAPI_VARS
readonly OPENAPI_VARS_DEFAULT=(
  "${APPX_DIR}/src"
  "${APPX_DIR}/assembly"
  "_openapi.yaml"
  "client/auth"
)

function mrcmd_plugins_openapi_method_config() {
  mrcore_dotenv_echo_var_array OPENAPI_VARS[@]
}

function mrcmd_plugins_openapi_method_export_config() {
  mrcore_dotenv_export_var_array OPENAPI_VARS[@]
}

function mrcmd_plugins_openapi_method_init() {
  mrcore_dotenv_init_var_array OPENAPI_VARS[@] OPENAPI_VARS_DEFAULT[@]

  mrcore_validate_dir_required "Specification dir" "${OPENAPI_SPEC_DIR}"
  mrcore_validate_dir_required "Assembly dir" "${OPENAPI_ASSEMBLY_DIR}"
}

function mrcmd_plugins_openapi_method_exec() {
  local currentCommand=${1:?}
  local commonSrc="${OPENAPI_SPEC_DIR}/common"

  case ${currentCommand} in

    gen-all)
      ./mrcmd openapi gen-client-auth
      ;;

    gen-client-auth)
      local serviceSrc="${OPENAPI_SPEC_DIR}/${OPENAPI_SERVICE_CLIENT_AUTH}"
      local destFilePath="${OPENAPI_ASSEMBLY_DIR}/${OPENAPI_SERVICE_CLIENT_AUTH}${OPENAPI_SERVICE_FILE_POSTFIX}"
      mrcmd_plugins_call_function "openapi/gen-client-auth" "${commonSrc}" "${serviceSrc}" "${destFilePath}"
      ;;

    *)
      ${RETURN_FALSE}
      ;;

  esac
}

function mrcmd_plugins_openapi_method_help() {
  #markup:"------------------------------|||||||||||||||||||||||||||||||||||||||||||||"
  echo -e "    gen-all                   Build all services"
  echo -e "    gen-client-auth           Build service Client Auth"
}
