 include("PyLaunchyCommon.pro")
 
 TEMPLATE      = lib
 CONFIG       += plugin
 FORMS         = 
 VPATH         = pylaunchy/
 
 TARGET		   = PyLaunchy
 
 RESOURCES     = PyLaunchyPlugin.qrc
 
 win32 {
     CONFIG -= embed_manifest_dll
}

DISTFILES += \
    pylaunchy.json
