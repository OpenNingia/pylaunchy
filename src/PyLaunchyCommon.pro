# Check for requried environment variables
!exists($$(PYTHON_INCLUDE_DIR)) {
 error("The PYTHON_INCLUDE_DIR environment variable is not defined.")
}
!exists($$(PYTHON_LIB_FILE)) {
error("The PYTHON_LIB_FILE environment variable is not defined.")
}
!exists($$(BOOST_ROOT)) {
error("The BOOST_ROOT environment variable is not defined.")
}
!exists($$(BOOST_LIBRARYDIR)) {
error("The BOOST_LIBRARYDIR environment variable is not defined.")
}

HEADERS       = launchy/catalog.h launchy/plugin_interface.h
# SOURCES       = launchy/catalog.cpp launchy/plugin_interface.cpp
SOURCES       = launchy/plugin_interface.cpp

HEADERS      += PyLaunchyPlugin.h
SOURCES      += PyLaunchyPlugin.cpp

HEADERS      += ScriptPlugin.h ScriptPluginWrapper.h
SOURCES      += ScriptPluginWrapper.cpp

HEADERS      += ScriptsDirectoryConfig.h ScriptPluginsManager.h ScriptPluginsSynchronizer.h PythonInitializer.h GlobalPythonModuleData.h
SOURCES      += ScriptsDirectoryConfig.cpp ScriptPluginsManager.cpp ScriptPluginsSynchronizer.cpp PythonInitializer.cpp GlobalPythonModuleData.cpp

HEADERS      += qt_utils/QSettingsWrapper.h qt_utils/QTemporaryFileWrapper.h
SOURCES      += qt_utils/QSettingsWrapper.cpp qt_utils/QTemporaryFileWrapper.cpp

SOURCES      += \
python_export/python_export.cpp \
python_export/python_export_pylaunchy.cpp \
python_export/python_export_qstring.cpp \
python_export/python_export_catalog.cpp \
python_export/python_export_ScriptPlugin.cpp

HEADERS      += Precompiled.h
SOURCES      += Precompiled.cpp

PRECOMPILED_HEADER = Precompiled.h

INCLUDEPATH = ezlogger $$(PYTHON_INCLUDE_DIR) $$(BOOST_ROOT)
 
# QMAKE_CXXFLAGS_RELEASE += /Z7
# QMAKE_LFLAGS_RELEASE += /DEBUG

win32 {
    DEFINES += _CRT_SECURE_NO_DEPRECATE
    LIBS += shell32.lib
    LIBS += $$(PYTHON_LIB_FILE)
    LIBS += -L$$(BOOST_LIBRARYDIR)
}
