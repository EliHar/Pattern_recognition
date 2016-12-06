MACRO(ADD_TORCH_WRAP target luafile)
  INCLUDE_DIRECTORIES("${CMAKE_CURRENT_BINARY_DIR}")
  GET_FILENAME_COMPONENT(_file_ "${luafile}" NAME_WE)
  SET(cfile "${_file_}.c")
  IF (DEFINED CWRAP_CUSTOM_LUA)
    ADD_CUSTOM_COMMAND(
	OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${cfile}"
	COMMAND ${CWRAP_CUSTOM_LUA} ARGS "${CMAKE_CURRENT_SOURCE_DIR}/${luafile}" "${CMAKE_CURRENT_BINARY_DIR}/${cfile}"
    	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    	DEPENDS "${luafile}")
  ELSE (DEFINED CWRAP_CUSTOM_LUA)
    ADD_CUSTOM_COMMAND(
	OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${cfile}"
      	COMMAND /root/torch/install/bin/luajit ARGS "${CMAKE_CURRENT_SOURCE_DIR}/${luafile}" "${CMAKE_CURRENT_BINARY_DIR}/${cfile}"
      	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
      	DEPENDS "${luafile}")
  ENDIF (DEFINED CWRAP_CUSTOM_LUA)
  ADD_CUSTOM_TARGET(${target} DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/${cfile}")
ENDMACRO(ADD_TORCH_WRAP)